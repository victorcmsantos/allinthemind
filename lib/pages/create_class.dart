import 'dart:convert';
import 'package:allinthemind/utils/courses/list/courses_list.dart';
import 'package:allinthemind/utils/courses/list/courses_list_api.dart';
import 'package:allinthemind/widgets/app_menu_bar.dart';
import 'package:allinthemind/widgets/app_dropdown_button.dart';
import 'package:allinthemind/widgets/app_text.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class CreateClass extends StatefulWidget {
  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: LateralMenu(),
      body: _body(),
    );
  }

  _body() {
    return _blabla();
  }

  _blabla() {
    return AppDropDownButton();
  }
}

//
//import 'dart:convert';
//import 'package:allinthemind/utils/courses/list/courses_list.dart';
//import 'package:allinthemind/utils/courses/list/courses_list_api.dart';
//import 'package:allinthemind/widgets/app_menu_bar.dart';
//import 'package:allinthemind/widgets/app_text.dart';
//import 'package:allinthemind/widgets/lateral_menu.dart';
//import 'package:flutter/material.dart';
//import 'dart:convert' as convert;
//
//class CreateClass extends StatefulWidget {
//  @override
//  _CreateClassState createState() => _CreateClassState();
//}
//
//class _CreateClassState extends State<CreateClass> {
//  final _formKey = GlobalKey<FormState>();
//  final _controllerClassName = TextEditingController();
//
//  bool _showProgress = false;
//
//  String dropdownValue = 'One';
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBarWidget(appBar: AppBar()),
//      drawer: LateralMenu(),
//      body: _body(),
//    );
//  }
//
//  _body() {
//    Future<List<CoursesList>> courses = CoursesListApi.getCourses();
//    return FutureBuilder(
//      future: courses,
//      builder: (context, snapshot) {
//        if (snapshot.hasError) {
//          return Center(
//            child: Text(
//              "Nao foi possivel conectar ao servidor",
//              style: TextStyle(
//                color: Colors.red,
//                fontSize: 22,
//              ),
//            ),
//          );
//        }
//        if (!snapshot.hasData) {
//          return Center(
//            child: CircularProgressIndicator(),
//          );
//        }
//        List<CoursesList> courses = snapshot.data;
//        return _form(courses);
//      },
//    );
//  }
//
//  _form(List<CoursesList> courses) {
//    List<CoursesList> _region = [];
//    String map = convert.json.encode(courses);
//    var json = JsonDecoder().convert(map);
//    _region =
//        (json).map<CoursesList>((item) => CoursesList.fromJson(item)).toList();
//
//    var dropdownValue = _region[0].name;
//
//    return Form(
//      key: _formKey,
//      child: Container(
//        padding: EdgeInsets.all(16),
//        child: ListView(
//          children: <Widget>[
//            AppText(
//              "Classe",
//              "Digite o nome da nova Classe",
//              controller: _controllerClassName,
//              validator: _validatorClassName,
//            ),
//            SizedBox(
//              height: 16,
//            ),
//            DropdownButton<String>(
//              value: dropdownValue,
//              icon: Icon(Icons.arrow_downward),
//              iconSize: 24,
//              elevation: 16,
//
//              underline: Container(
//                height: 2,
//                color: Colors.black,
//              ),
//              onChanged: (String newValue) {
//                setState(() {
//                  dropdownValue = newValue;
//                });
//              },
//              items: _region.map((CoursesList map) {
//                return new DropdownMenuItem<String>(
//                  value: map.name,
//                  child: new Text(map.name,
//                      style: new TextStyle(color: Colors.black)),
//                );
//              }).toList(),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  String _validatorClassName(String value) {
//    if (value.isEmpty) {
//      return "Digite o Login";
//    }
//    return null;
//  }
//}
//
