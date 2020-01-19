import 'package:allinthemind/utils/as_admin/list_users.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'dart:convert' as convert;
import 'package:allinthemind/vars/vars.dart' as globals;
import 'package:http/http.dart' as http;


class ListUsersApi {
  static Future<List<ListUsers>> getUsers() async {

    User user = await User.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var response = await http.get(globals.webserver_url + '/admin/users', headers: headers);


    List list = convert.json.decode(response.body);

    final users = List<ListUsers>();

    for (Map map in list) {
      ListUsers c = ListUsers.fromJson(map);
      users.add(c);
    }

    print(users);

    return users;



  }
}