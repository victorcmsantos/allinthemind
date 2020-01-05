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
              child: Text("Sobre Nos"),
            ),
            PopupMenuItem(
              child: Text("logado? Minha Conta"),
            ),
            PopupMenuItem(
              child: Text("LoginLogout"),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
