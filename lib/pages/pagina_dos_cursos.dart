import 'package:allinthemind/utils/web.dart';
import 'package:allinthemind/utils/webserver_http.dart';
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>  {



   //bool ok = await HTTP_Webserver.main();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: LateralMenu(),
      body: Container(
        color: Colors.white70,
        child: Center(
//          child: Text(_statusResponse().toString()),
          child: Text(WebServer().toString()),
        ),

      ),
    );
  }

   Future<String> _statusResponse()  async {
     String ok = await HTTP_Webserver.main();

     return ok;

   }


}
