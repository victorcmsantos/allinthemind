import 'package:allinthemind/pages/login_page.dart';
import 'package:allinthemind/pages/my_page.dart';
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
            return _PopupMenuButton(context, user);
//            return user != null
//                ? _PopupMenuButton(context, user)
//                : Container();
          },
        ),

//        _PopupMenuButton(context),
      ],
    );
  }

  PopupMenuButton<Widget> _PopupMenuButton(BuildContext context, User user) {
    return PopupMenuButton(
      icon: _userIcon(user),

      offset: Offset(200, 100),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              push(context, MyPage());
            },
            child: Container(
              child: Center(
                child: Text(user.username),
              ),
            ),
          ),
        ),

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

//        _popupMenuItem(context, pushTo: MyPage(), text: "meu user"),
//        _popupMenuItem(context, pushTo: LoginPage(), text: "Login")
      ],
//      onCanceled: () {
//        print("You have canceled the menu.");
//      },
//      onSelected: (value) {
//        push(context, value);
//      },
    );
  }

  ClipRRect _userIcon(User user) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        user != null
            ? 'assets/imagens/FILE0114.png'
            : 'assets/imagens/icognito_user.png',
//              fit: BoxFit.fill,
      ),
    );
  }

//  PopupMenuItem<Widget> _popupMenuItem(
//    BuildContext context, {
//    String text,
//    pushTo,
//  }) {
//    return PopupMenuItem(
//      child: InkWell(
//        onTap: () {
//          Navigator.pop(context);
//          push(context, pushTo);
//        },
//        child: Container(
//          child: Center(
//            child: Text(
//              text,
//            ),
//          ),
//        ),
//      ),
//    );
//  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
