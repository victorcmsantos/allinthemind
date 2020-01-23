import 'package:allinthemind/pages/register_page.dart';
import 'package:allinthemind/utils/as_admin/list_users.dart';
import 'package:allinthemind/utils/classes/list_classes.dart';
import 'package:allinthemind/utils/classes/user_of_class_api.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:allinthemind/widgets/app_menu_bar.dart';
import 'package:allinthemind/widgets/app_button.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';

class ClassPage extends StatefulWidget {

  ListClasses course;

  ClassPage(this.course);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {

    Future<User> future = User.get();
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
//      drawer: LateralMenu(),
      body: FutureBuilder<User>(
        future: future,
        builder: (context, snapshot) {
          User user = snapshot.data;
          if (user != null) {
            return _body();
          } else {
            return Container(
                  child: Text("sdf"),
                );
          }
        },
      ),
    );
  }

  _body() {
    Future<List<ListUsers>> users = ListClassUsersApi.getUsers(widget.course.classname);

    return FutureBuilder(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Nao foi possivel conectar ao servidor",
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<ListUsers> users = snapshot.data;
        return _realbody(users);
      },
    );
  }

  _realbody(List<ListUsers> users) {
    return Container(
      //      height: 400,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: AppButton(
              "Adicionar alunos a classe",
              onPressed_f: () => push(context, RegisterPage(), replace: true),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: users != null ? users.length : 0,
              itemBuilder: (context, index) {
                ListUsers c = users[index];

                return Card(
                  color: Colors.grey[200],
                  child: Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(c.username),
                        Text(c.email),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
