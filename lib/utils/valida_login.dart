import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/vars/vars.dart' as globals;
import 'package:http/http.dart' as http;

class ValidaLogin {
  static Future<List<ValidaLogin>> validator() async {
    User user = await User.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var response = await http.get(globals.webserver_url + '/tokenvalidator',
        headers: headers);

    if (response.statusCode != 200) {
      User.remove();
    }
  }
}
