import 'package:allinthemind/pages/login_page.dart';
//import 'package:allinthemind/pages/my_page.dart';
import 'package:allinthemind/utils/alert.dart';
import 'package:allinthemind/utils/login/api_response.dart';
//import 'package:allinthemind/utils/login/loging_api.dart';
import 'package:allinthemind/utils/login/register_api.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/app_button.dart';
import 'package:allinthemind/widgets/app_text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerPass = TextEditingController();
  final _controllerEmail = TextEditingController();


  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      body: _build(context),
    );
  }

  Form _build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              "apelido",
              "Digite seu apelido",
              controller: _controllerLogin,
              validator: _validatorLogin,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "email",
              "Digite seu email",
              controller: _controllerEmail,
              validator: _validatorLogin,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Senha",
              "Digite sua Senha",
              obscure: true,
              controller: _controllerPass,
              validator: _validatorSenha,
            ),
            SizedBox(
              height: 10,
            ),
//            AppText(
//              "Senha",
//              "Repetir a sua Senha",
//              obscure: true,
//              controller: _controllerPass,
//              validator: _validatorSenha,
//            ),
//            SizedBox(
//              height: 10,
//            ),

            AppButton(
              "Registrar-se",
              onPressed_f: _onClickRegister,
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickRegister() async {
    String login = _controllerLogin.text;
    String pass = _controllerPass.text;
    String email = _controllerEmail.text;

    bool formkey = _formKey.currentState.validate();

    if (!formkey) {
      return;
    }

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await RegisterApi.register(login, pass, email);

    if (response.ok) {
      User user = response.result;

      print(">>>> $user");

      push(context, LoginPage());
    } else {
      alert(context, response.msg);
    }

    setState(() {
      _showProgress = false;
    });
  }

  String _validatorLogin(String text) {
    if (text.isEmpty) {
      return "Digite o Login";
    }
    return null;
  }

  String _validatorSenha(String text) {
    if (text.isEmpty) {
      return "Digite a Senha";
    }
    return null;
  }
}
