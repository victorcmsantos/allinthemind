

import 'package:allinthemind/pages/courses_list_page.dart';
import 'package:allinthemind/pages/initial_page.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:flutter/material.dart';

class LateralMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.orange,
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: () {
                  print("asd");
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
              Divider(),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Cursos"),
                subtitle: Text("Todos os Cursos"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print("foddaaaaa");
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
