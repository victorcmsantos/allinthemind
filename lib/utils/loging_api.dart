import 'dart:convert';
import 'package:allinthemind/utils/api_response.dart';
import 'package:allinthemind/utils/user.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<User>> login(String login, String senha) async {
    try {
      //var url = "http://10.123.233.176:86/login";
      var url = "http://192.168.1.177:86/login";


      Map params = {
        "username": login,
        "password": senha,
      };

      String json_params = json.encode(params);

      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      var response = await http.post(
        url,
        body: json_params,
        headers: headers,
      );

      print('Response status: ${response.statusCode}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = User.fromJson(mapResponse);
        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["msg"]);
    } catch (error, exception) {
      print("Erro no Login $error > $exception");

      return ApiResponse.error("nao possivel conectar ao servidor");

    }
  }
}
