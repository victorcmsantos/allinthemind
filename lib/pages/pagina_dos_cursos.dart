import 'package:allinthemind/utils/webserver_http.dart';
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';

class PaginaCursos extends StatefulWidget {
  @override
  _PaginaCursosState createState() => _PaginaCursosState();
}

class _PaginaCursosState extends State<PaginaCursos>  {



   //bool ok = await HTTP_Webserver.main();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      drawer: MenuLateral(),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Text(_statusResponse().toString()),
        ),

      ),
    );
  }

   Future<String> _statusResponse()  async {
     String ok = await HTTP_Webserver.main();

     return ok;

   }


}
