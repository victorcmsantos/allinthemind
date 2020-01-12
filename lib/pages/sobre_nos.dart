import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';

class SobreNos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: MenuLateral(),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Text("Sobre nos"),
        ),
      ),
    );
  }
}
