import 'package:allinthemind/pages/class_page.dart';
import 'package:allinthemind/pages/create_class_page.dart';
import 'package:allinthemind/utils/classes/list_classes.dart';
import 'package:allinthemind/utils/classes/list_classes_api.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:allinthemind/widgets/app_menu_bar.dart';
import 'package:allinthemind/widgets/app_button.dart';
import 'package:allinthemind/widgets/lateral_menu.dart';
import 'package:flutter/material.dart';

class TutorPage extends StatefulWidget {
  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  @override
  Widget build(BuildContext context) {
    Future<User> future = User.get();

    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
//      drawer: LateralMenu(),
      body: FutureBuilder<User>(
        future: future,
        builder: (context, snapshot) {
          User user = snapshot.data;
          return user != null ? _body() : Container();
        },
      ),
    );
  }

//  _body() {
//    return _realbody();
//  }

  _body() {
    Future<List<ListClasses>> classe =
        ListClassessApi.getClasses('/classes/list');

    return FutureBuilder(
      future: classe,
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
        List<ListClasses> classe = snapshot.data;
        return _realbody(classe);
      },
    );
  }

  _realbody(List<ListClasses> classe) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: AppButton(
                  "Criar nova Classe",
                  onPressed_f: () =>
                      push(context, CreateClassPage(), replace: true),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Classe"),
                Text("Curso"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: classe != null ? classe.length : 0,
              itemBuilder: (context, index) {
                ListClasses c = classe[index];
                return Card(
                  color: Colors.grey[200],
                  child: InkWell(
                    onTap: () {
                      push(context, ClassPage(c));
                    },
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(c.classname),
                          Text(c.course),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
