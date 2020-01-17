import 'package:allinthemind/pages/courses_list_page.dart';
import 'package:allinthemind/pages/initial_page.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:flutter/material.dart';

class LateralMenu extends StatelessWidget {
  _headerInkWell(context, User user) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        push(context, InitialPage());
      },
      child: Container(
        height: 150,
        child: Center(
            child: Text(user.username,
                //     child: Text("All In The Mind",
                style: TextStyle(fontSize: 35))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<User> future = User.get();

    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.orange,
          child: ListView(
            children: <Widget>[
              FutureBuilder<User>(
                future: future,
                builder: (context, snapshot) {
                  User user = snapshot.data;
                //  return _headerInkWell(context, user);
                  return user != null
                      ? _headerInkWell(context, user)
                      : Container();
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Cursos"),
                subtitle: Text("Todos os Cursos"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pop(context);
                  push(context, CoursesListPage());
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}


//
//
//import 'package:allinthemind/pages/courses_list_page.dart';
//import 'package:allinthemind/pages/initial_page.dart';
//import 'package:allinthemind/utils/nav.dart';
//import 'package:flutter/material.dart';
//
//class LateralMenu extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Drawer(
//        child: Container(
//          color: Colors.orange,
//          child: ListView(
//            children: <Widget>[
//              InkWell(
//                onTap: () {
//                  Navigator.pop(context);
//                  push(context, InitialPage());
//                },
//                child: Container(
//                  height: 150,
//                  child: Center(
//                      child: Text("All In The Mind",
//                          style: TextStyle(fontSize: 35))),
//                ),
//              ),
//              Divider(),
//              ListTile(
//                leading: Icon(Icons.star),
//                title: Text("Cursos"),
//                subtitle: Text("Todos os Cursos"),
//                trailing: Icon(Icons.arrow_forward),
//                onTap: () {
//                  Navigator.pop(context);
//                  push(context, CoursesListPage());
//                },
//              ),
//              Divider(),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
