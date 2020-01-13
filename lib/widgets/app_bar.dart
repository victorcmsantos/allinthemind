

import 'package:allinthemind/pages/about_us.dart';
import 'package:allinthemind/pages/login_page.dart';
import 'package:allinthemind/pages/my_page.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const AppBarWidget({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      actions: <Widget>[
        PopupMenuButton(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/imagens/FILE0114.png',
//              fit: BoxFit.fill,
            ),
          ),
          offset: Offset(200, 100),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: AboutUS(),
              child: Text("Sobre Nos"),
            ),
            PopupMenuItem(
              value: MyPage(),
              child: Text("logado? Minha Conta"),
            ),
            PopupMenuItem(
              value: LoginPage(),
              child: Text("LoginLogout"),
            ),
          ],
          onCanceled: () {
            print("You have canceled the menu.");
          },
          onSelected: (value) {
            push(context, value);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
