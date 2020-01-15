import 'package:allinthemind/utils/courses/intro/course_intro_api.dart';
import 'package:allinthemind/utils/courses/intro/course_introduction.dart';
import 'package:allinthemind/utils/courses/list/courses_list.dart';
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';

class CourseIntroPage extends StatelessWidget {
  CoursesList course;

  CourseIntroPage(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: LateralMenu(),
      body: _body(),
    );
  }

//  Container _body() {
//    return Container(
//      color: Colors.white70,
//      child: Center(
//        child: Text(course.introductionJson),
//      ),
//    );
//  }

  _body() {
    //CoursesIntro actualcourse = CourseIntroApi.getCourses(course.introductionJson);
    Future<CoursesIntro> actualcourse =
        CourseIntroApi.getCourses(course.introductionJson);
    //Future<Map<CoursesIntro>> actualcourse = CourseIntroApi.getCourses(course.introductionJson);

    //Future<List<CoursesIntro>> actualcourse = CourseIntroApi.getCourses(course.introductionJson);

    return FutureBuilder(
      future: actualcourse,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot);
          return Center(
            child: Text(
              "Nao foi possivel conectar ao servidor",
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        CoursesIntro courses = snapshot.data;
        return _qlqrnome(courses);
      },
    );
  }

  Container _qlqrnome(CoursesIntro courses) {
    return Container(
      child: Center(child: Text(courses.title)),
    );
  }
}
