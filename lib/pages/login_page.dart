import 'package:allinthemind/pages/my_page.dart';
import 'package:allinthemind/utils/alert.dart';
import 'package:allinthemind/utils/login/api_response.dart';
import 'package:allinthemind/utils/login/loging_api.dart';
import 'package:allinthemind/utils/nav.dart';
import 'package:allinthemind/utils/login/user.dart';
import 'package:allinthemind/widgets/app_bar.dart';
import 'package:allinthemind/widgets/app_button.dart';
import 'package:allinthemind/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerPass = TextEditingController();

  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBar: AppBar()),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              AppText(
                "Login",
                "Digite seu usuario",
                controller: _controllerLogin,
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
              AppButton(
                "Login",
                onPressed_f: _onClickLogin,
                showProgress: _showProgress,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClickLogin() async {
    String login = _controllerLogin.text;
    String pass = _controllerPass.text;

    bool formkey = _formKey.currentState.validate();

    if (!formkey) {
      return;
    }

    print(login);
    print(pass);

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await LoginApi.login(login, pass);

    if (response.ok) {
      User user = response.result;

      print(">>>> $user");

      push(context, MyPage());
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
