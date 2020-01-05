import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.orange,
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: () {
                  print("asd");
                  Navigator.pop(context);
                },
                child: Container(
                  height: 150,
                  child: Center(
                      child: Text("All In The Mind",
                          style: TextStyle(fontSize: 35))),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
