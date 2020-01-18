import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    Future<User> future = User.get();

    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: LateralMenu(),
      body: FutureBuilder<User>(
        future: future,
        builder: (context, snapshot) {
          User user = snapshot.data;
          return user != null ? _body(user) : Container();
        },
      ),

//      body: _body(),
    );
  }

  Container _body(User user) {
    return Container(
      color: Colors.white70,
      child: Center(
        child: Text("Todos os Usuarios"),
//        child: Column(
//          children: <Widget>[
//            Text('Classes'),
//          ],
//        ),
      ),
    );
  }
}
