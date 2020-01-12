import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: MenuLateral(),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Text("Inicical"),
        ),
      ),
    );
  }
}
