import 'dart:convert' as convert;
import 'package:allinthemind/utils/courses/intro/course_introduction.dart';
import 'package:http/http.dart' as http;
import 'package:allinthemind/vars/vars.dart' as globals;

class CourseIntroApi {

  static Future<CoursesIntro> getCourses(url_extension) async {
    var response = await http.get(globals.webserver_url + url_extension);


    Map mapResponse = convert.json.decode(response.body);

    final c = CoursesIntro.fromJson(mapResponse);

    //print(c);

    return c;
  }

}