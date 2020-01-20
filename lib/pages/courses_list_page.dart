import 'package:allinthemind/pages/course_intro_page.dart';
import 'package:allinthemind/utils/courses/list/courses_list.dart';
import 'package:allinthemind/utils/courses/list/courses_list_api.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:allinthemind/widgets/app_menu_bar.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';
import 'package:allinthemind/vars/vars.dart' as globals;

class CoursesListPage extends StatefulWidget {
  @override
  _CoursesListPageState createState() => _CoursesListPageState();
}

class _CoursesListPageState extends State<CoursesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: LateralMenu(),
      body: _body(),
    );
  }

  _body() {
    Future<List<CoursesList>> courses = CoursesListApi.getCourses();

    return FutureBuilder(
      future: courses,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
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
        List<CoursesList> courses = snapshot.data;
        return _listView(courses);
      },
    );
  }

  Container _listView(List<CoursesList> courses) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        itemCount: courses != null ? courses.length : 0,
        itemBuilder: (context, index) {
          CoursesList c = courses[index];

          return Card(
            color: Colors.grey[200],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment(1, 1),
                    child: Column(
                      children: <Widget>[
                        Text("Criado em " + c.createdAt),
                        Text("Atualizado em " + c.updatedAt),
                      ],
                    ),
                  ),
                  Center(
                    child: Image.network(
                      globals.webserver_url + c.descriptionLogo,
                      width: 150,
                    ),
                  ),
                  Text(
                    c.name,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    c.descriptionText,
                    style: TextStyle(fontSize: 22),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () => _onClickCourse(c),
                        ),
                        FlatButton(
                          child: const Text('SHARE'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCourse(CoursesList c) {
    push(context, CourseIntroPage(c));

  }

}
