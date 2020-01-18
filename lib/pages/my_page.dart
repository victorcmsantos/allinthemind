//import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';
//import 'dart:convert' as convert;

class MyPage extends StatefulWidget {
  MyPage();


  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
 // Future<User> user = User.get();
  //Map map = convert.json.decode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: LateralMenu(),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Text("blabla"),
        ),
      ),
    );
  }
}
