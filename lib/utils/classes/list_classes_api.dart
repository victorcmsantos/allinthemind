import 'package:allinthemind/utils/classes/list_classes.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'dart:convert' as convert;
import 'package:allinthemind/vars/vars.dart' as globals;
import 'package:http/http.dart' as http;


class ListClassessApi {
  static Future<List<ListClasses>> getClasses(url_extension) async {

    User user = await User.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var response = await http.get(globals.webserver_url + url_extension , headers: headers);


    List list = convert.json.decode(response.body);

    final classe = List<ListClasses>();

    for (Map map in list) {
      ListClasses c = ListClasses.fromJson(map);
      classe.add(c);
    }

    print(classe);

    return classe;



  }
}