import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/components/change_page_button.dart';
import 'package:gambot/pages/participate.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Colocar as paradas de login aqui'),
              ),
            ),
            ChangePageButton(texto: "Entrar", page: Participate()),
          ],
        ));
  }
}
