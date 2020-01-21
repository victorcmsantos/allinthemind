import 'dart:convert';
import 'package:allinthemind/utils/classes/list_classes.dart';
import 'package:allinthemind/utils/misc/api_response.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'package:http/http.dart' as http;
import 'package:allinthemind/vars/vars.dart' as globals;


class CreateClassApi {
  static Future<ApiResponse<ListClasses>> register(String classname, String course) async {
    User user = await User.get();
    try {
      Map params = {
        "classname": classname,
        "course": course,
      };

      String json_params = json.encode(params);

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${user.token}"
      };

      var response = await http.post(
        globals.webserver_url + '/class/add',
        body: json_params,
        headers: headers,
      );

      print('Response status: ${response.statusCode}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = ListClasses.fromJson(mapResponse);

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["msg"]);
    } catch (error, exception) {
      print("Erro no Login $error > $exception");

      return ApiResponse.error("nao foi possivel conectar no servidor");
    }
  }
}

