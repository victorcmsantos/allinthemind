import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        appBar: AppBar(),
      ),
      drawer: LateralMenu(),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Text("Inicical"),
        ),
      ),
    );
  }
}

class Courses {
  const Courses({this.coursesname});

  final Text coursesname;
}

const List<Courses> courses = <Courses>[
  const Courses(coursesname: Text('All Courses')),
  const Courses(coursesname: Text('Favorite Courses')),
  const Courses(coursesname: Text('Archived Courses')),
  const Courses(coursesname: Text('Offline Ready Courses')),
];
