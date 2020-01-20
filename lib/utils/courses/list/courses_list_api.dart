import 'dart:convert' as convert;
import 'package:allinthemind/utils/courses/list/courses_list.dart';
import 'package:http/http.dart' as http;
import 'package:allinthemind/vars/vars.dart' as globals;

class CoursesListApi {
  static Future<List<CoursesList>> getCourses() async {
    var response = await http.get(globals.webserver_url + '/courses');

    List list = convert.json.decode(response.body);

    final courses = List<CoursesList>();

    for (Map map in list) {
      CoursesList c = CoursesList.fromJson(map);
      courses.add(c);
    }

//    print(courses);

    return courses;

  }
}
