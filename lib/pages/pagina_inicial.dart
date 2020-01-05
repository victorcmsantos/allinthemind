import 'package:flutter/material.dart';

class Inicial extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Inicial> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: Center(
        child: Text("Foda"),
      ),
    );
  }
}
