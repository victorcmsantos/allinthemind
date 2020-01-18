import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/widgets/app_bar.dart';
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
      drawer: LateralMenu(),
      body: FutureBuilder<User>(
        future: future,
        builder: (context, snapshot) {
          User user = snapshot.data;
          return user != null ? _body(user) : Container();
        },
      ),
    );
  }

  Container _body(User user) {
    return Container(
      color: Colors.white70,
      child: Center(
        child: Text("Minhas Classes"),
//        child: Column(
//          children: <Widget>[
//            Text('Classes'),
//          ],
//        ),
      ),
    );
  }
}
