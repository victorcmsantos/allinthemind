import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';

class PaginaPessoal extends StatefulWidget {
  @override
  _PaginaPessoalState createState() => _PaginaPessoalState();
}

class _PaginaPessoalState extends State<PaginaPessoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: MenuLateral(),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Text("Pagina Pessoal"),
        ),
      ),
    );
  }
}
