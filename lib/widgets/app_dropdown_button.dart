

import 'package:flutter/material.dart';

class AppDropDownButton extends StatefulWidget {
  @override
  _AppDropDownButtonState createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("aasdasdasda"),
      ),
    );
  }
}

















//import 'dart:convert' as convert;
//import 'dart:convert';
//
//import 'package:allinthemind/utils/courses/list/courses_list.dart';
//import 'package:flutter/material.dart';
//
//class AppDropDownButton extends StatefulWidget {
//
//  final _formKey = GlobalKey<FormState>();
//  final _controllerClassName = TextEditingController();
//
//
//
//  @override
//  _AppDropDownButtonState createState() => _AppDropDownButtonState();
//}
//
//class _AppDropDownButtonState extends State<AppDropDownButton> {
//  @override
//  Widget build(BuildContext context) {
//
//
////    form(List<CoursesList> courses) {
////
////
////      List<CoursesList> _region = [];
////      String map = convert.json.encode(courses);
////      var json = JsonDecoder().convert(map);
////      _region =
////          (json).map<CoursesList>((item) => CoursesList.fromJson(item)).toList();
////
////      var dropdownInitialValue = _region[0].name;
//
//      return Form(
//        key: _formKey,
//        child: Container(
//          padding: EdgeInsets.all(16),
//          child: ListView(
//            children: <Widget>[
//              AppText(
//                "Classe",
//                "Digite o nome da nova Classe",
//                controller: _controllerClassName,
//                validator: _validatorClassName,
//              ),
//              SizedBox(
//                height: 16,
//              ),
//              DropdownButton<String>(
//                value: dropdownInitialValue,
////              value: dropdownValue,
//
//                icon: Icon(Icons.arrow_downward),
//                iconSize: 24,
//                elevation: 16,
//                style: TextStyle(color: Colors.deepPurple),
//                underline: Container(
//                  height: 2,
//                  color: Colors.deepPurpleAccent,
//                ),
//                onChanged: (String newValue) {
//                  setState(() {
////                  dropdownValue = newValue;
//                    dropdownInitialValue = newValue;
//                  });
//                },
//
//
////              items: <String>['One', 'Two', 'Free', 'Four']
////                  .map<DropdownMenuItem<String>>((String value) {
////                return DropdownMenuItem<String>(
////                  value: value,
////                  child: Text(value),
////                );
////              }).toList(),
//
//
//
//                items: _region.map((CoursesList map) {
//                  return new DropdownMenuItem<String>(
//                    value: map.name,
//                    child: new Text(map.name,
//                        style: new TextStyle(color: Colors.black)),
//                  );
//                }).toList(),
//              ),
//            ],
//          ),
//        ),
//      );
////    }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//  }
//}
