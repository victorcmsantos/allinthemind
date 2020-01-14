import 'dart:convert' as convert;
import 'package:allinthemind/utils/courses/courses.dart';
import 'package:http/http.dart' as http;
import 'package:allinthemind/vars/vars.dart' as globals;


class CoursesApi {
  static Future<List<Courses>> getCourses() async {
    //var url = "http://10.123.233.176:86";
    //var url = "http://192.168.1.177:86";
    //var url = "http://192.168.43.15:86";

    var response = await http.get(globals.webserver_url + '/courses');

    //String json = response.body;

    List list = convert.json.decode(response.body);

    final courses = List<Courses>();

    for (Map map in list) {
      Courses c = Courses.fromJson(map);
      courses.add(c);
    }


    return courses;

//    final courses = List<Courses>();
//    await Future.delayed(Duration(seconds: 3));
//    courses.add(
//      Courses(
//        name: "name01",
//        descriptionLogo: "${url}/courses/css/logo.png",
//      ),
//    );
//    courses.add(
//      Courses(
//        name: "name02",
//        descriptionLogo: "${url}/courses/html/logo.png",
//      ),
//    );
//    return courses;
  }
}
