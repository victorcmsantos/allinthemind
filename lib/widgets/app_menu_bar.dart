import 'package:allinthemind/pages/admin_page.dart';
import 'package:allinthemind/pages/login_page.dart';
import 'package:allinthemind/pages/my_page.dart';
import 'package:allinthemind/pages/tutor_page.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  AppBarWidget({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<User> future = User.get();

    return AppBar(
      backgroundColor: Colors.orange,
      actions: <Widget>[
        FutureBuilder<User>(
          future: future,
          builder: (context, snapshot) {
            User user = snapshot.data;
            return user != null
                ? _PopupMenuButton(context, user)
                : _PopupMenuButtonLogin(context, user);
          },
        ),
      ],
    );
  }

  PopupMenuButton<Widget> _PopupMenuButtonLogin(
      BuildContext context, User user) {
    return PopupMenuButton(
      icon: _userIcon(user),
      offset: Offset(200, 100),
      itemBuilder: (context) =>
          [_popupMenuItem(context, pushTo: LoginPage(), text: "Login")],
    );
  }

  PopupMenuButton<Widget> _PopupMenuButton(BuildContext context, User user) {
    return PopupMenuButton(
      icon: _userIcon(user),
      offset: Offset(200, 100),
      itemBuilder: (context) => [
        user.roles.contains('admin') == true
            ? _popupMenuItem(context, pushTo: AdminPage(), text: "Admin")
            : null,
        user.roles.contains('tutor') == true
            ? _popupMenuItem(context, pushTo: TutorPage(), text: "Tutor")
            : null,
        user != null
            ? _popupMenuItem(context, pushTo: MyPage(), text: user.username)
            : null,

        PopupMenuItem(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              if (user != null) {
                User.remove();
                push(context, LoginPage());
              } else {
                push(context, LoginPage());
              }
            },
            child: Container(
              child: Center(
                child: user != null ? Text("Logout") : Text("Login"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ClipRRect _userIcon(User user) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        user != null
            ? 'assets/imagens/FILE0114.png'
            : 'assets/imagens/icognito_user.png',
      ),
    );
  }

  PopupMenuItem<Widget> _popupMenuItem(
    BuildContext context, {
    String text,
    pushTo,
  }) {
    return PopupMenuItem(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          push(context, pushTo);
        },
        child: Container(
          child: Center(
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
