import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HTTP_Webserver {

  static Future<String> main() async {
    var url = 'http://192.168.1.177:86';

    var response = await http.get(url);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


    return response.body;

  }

}




