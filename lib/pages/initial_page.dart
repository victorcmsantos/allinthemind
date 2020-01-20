import 'package:allinthemind/widgets/app_menu_bar.dart';
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

