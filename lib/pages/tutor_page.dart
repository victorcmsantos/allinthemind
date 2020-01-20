import 'package:allinthemind/pages/create_class.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/app_button.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';

class TutorPage extends StatefulWidget {
  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
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
          return user != null ? _body() : Container();
        },
      ),
    );
  }

  _body() {
    return _realbody();
  }

//  _body() {
//  //  Future<List<ListUsers>> users = ListUsersApi.getUsers();
//
//    return FutureBuilder(
//      future: ,
//      builder: (context, snapshot) {
//        if (snapshot.hasError) {
//          return Center(
//            child: Text(
//              "Nao foi possivel conectar ao servidor",
//              style: TextStyle(
//                color: Colors.red,
//                fontSize: 22,
//              ),
//            ),
//          );
//        }
//
//        if (!snapshot.hasData) {
//          return Center(
//            child: CircularProgressIndicator(),
//          );
//        }
//        List<ListUsers> users = snapshot.data;
//        return _realbody(users);
//      },
//    );
//  }

  _realbody() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: AppButton(
                  "Criar nova Classe",
                  onPressed_f: () => push(context, CreateClass(), replace: true),
                ),
              ),
            ],
          ),
          Container(),

        ],
      ),
    );
  }
}
