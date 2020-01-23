import 'dart:convert';

import 'package:allinthemind/utils/as_admin/list_users.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'dart:convert' as convert;
import 'package:allinthemind/vars/vars.dart' as globals;
import 'package:http/http.dart' as http;


class ListClassUsersApi {
  static Future<List<ListUsers>> getUsers(String classname ) async {

    User user = await User.get();

    Map params = {
      "classname": classname,
    };

    String json_params = json.encode(params);

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var response = await http.post( globals.webserver_url + '/class/usersofclass', body: json_params, headers: headers);


    List list = convert.json.decode(response.body);

    print(response.body);

    final users = List<ListUsers>();

    for (Map map in list) {
      ListUsers c = ListUsers.fromJson(map);
      users.add(c);
    }

    //print(users);

    return users;



  }
}