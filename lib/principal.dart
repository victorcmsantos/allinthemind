import 'package:allinthemind/pages/initial_page.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return InitialPage();
//    return Scaffold(
//      appBar: AppBarWidget(appBar: AppBar()),
//      drawer: MenuLateral(),
//      body: Inicial(),
//    );
  }
}
