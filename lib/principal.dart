import 'package:allinthemind/pages/pagina_inicial.dart';
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/menu_lateral.dart';
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
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: MenuLateral(),
      body: Inicial(),
    );
  }
}
