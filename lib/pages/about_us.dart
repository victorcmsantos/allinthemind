
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';

class AboutUS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: LateralMenu(),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Text("Sobre nos"),
        ),
      ),
    );
  }
}
