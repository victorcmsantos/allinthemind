import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class WebServer extends StatefulWidget {
  @override
  _WebServerState createState() => _WebServerState();
}

class _WebServerState extends State<WebServer> {
  @override
  Widget build(BuildContext context) {
    var data;

    Future<String> getData() async {
      var response = await http.get("http://192.168.1.177:86");

      print("${response.body}");
      setState(() {
        data = response.body;
      });
      return "Success";
    }

    @override
    void initState() {
      super.initState();
      getData();
    }

    return data;


  }




}
