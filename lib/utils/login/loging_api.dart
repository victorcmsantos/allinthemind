import 'dart:convert';
import 'package:allinthemind/utils/login/api_response.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'package:http/http.dart' as http;
import 'package:allinthemind/vars/vars.dart' as globals;


class LoginApi {
  static Future<ApiResponse<User>> login(String login, String senha) async {
    try {
      Map params = {
        "username": login,
        "password": senha,
      };

      String json_params = json.encode(params);

      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      var response = await http.post(
        globals.webserver_url + '/login',
        body: json_params,
        headers: headers,
      );

    //  print('Response status: ${response.statusCode}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = User.fromJson(mapResponse);



        user.save();
//        User user2 = await User.get();
//        print("USER2:  $user2");


        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["msg"]);
    } catch (error, exception) {
      print("Erro no Login $error > $exception");

      return ApiResponse.error("nao possivel conectar ao servidor");
    }
  }
}
