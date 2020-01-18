import 'package:allinthemind/pages/about_us.dart';
import 'package:allinthemind/pages/courses_list_page.dart';
import 'package:allinthemind/pages/initial_page.dart';
//import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:flutter/material.dart';

class LateralMenu extends StatelessWidget {
//  _headerInkWell(context, User user) {
//    return InkWell(
//      onTap: () {
//        Navigator.pop(context);
//        push(context, InitialPage());
//      },
//      child: Container(
//        height: 150,
//        child: Center(
//            child: Text(user.username,
//                //     child: Text("All In The Mind",
//                style: TextStyle(fontSize: 35))),
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    //Future<User> future = User.get();

    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.orange,
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  push(context, InitialPage());
                },
                child: Container(
                  height: 150,
                  child: Center(
                      child: Text("All In The Mind",
                          style: TextStyle(fontSize: 35))),
                ),
              ),

//              FutureBuilder<User>(
//                future: future,
//                builder: (context, snapshot) {
//                  User user = snapshot.data;
//                  //  return _headerInkWell(context, user);
//                  return user != null
//                      ? _headerInkWell(context, user)
//                      : Container();
//                },
//              ),

              Divider(),
              _ListContent(
                context,
                icon: Icons.description,
                text: "Sobre Nos",
                subtext: "Missao  e Visao",
                pushTo: AboutUS(),
              ),
              Divider(),
              _ListContent(
                context,
                icon: Icons.star,
                text: "Cursos",
                subtext: "Todos os Cursos",
                pushTo: CoursesListPage(),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _ListContent(
    BuildContext context, {
    icon: Icon,
    text: String,
    subtext: String,
    pushTo,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      subtitle: Text(subtext),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.pop(context);
        push(context, pushTo);
      },
    );
  }
}

