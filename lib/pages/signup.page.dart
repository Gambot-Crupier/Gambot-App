import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gambot/components/default_button.dart';
import 'package:gambot/pages/login.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class SignupPage extends StatefulWidget {

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _signUpData = {
    'name': '',
    'username': '',
    'email': '',
    'password': '',
  };

  Future<void> submit() async {

    _formKey.currentState.save();

    try{
      await Provider.of<Auth>(context, listen: false).signUp(_signUpData);
      Navigator.of(context).pop();
    } on Exception catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erro"),
            content: Text(error.toString())
          );
        },
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erro"),
            content: Text("Erro ao se cadastrar, tente novamente!")
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_login.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
        ),
        padding: EdgeInsets.only(top: 130, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            Divider(),
            Form(
              key:_formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      onSaved: (value) {
                        _signUpData['name'] = value;
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelText: "Nome",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'McLaren',
                        ),
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      onSaved: (value) {
                        _signUpData['username'] = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),                
                        labelText: "Username",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'McLaren',
                        ),
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      onSaved: (value) {
                        _signUpData['email'] = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),                
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'McLaren',
                        ),
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      onSaved: (value) {
                        _signUpData['password'] = value;
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'McLaren',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 160, 
                    child: DefaultButton(
                      text: 'Cadastrar', 
                      fontSize: 15.0, 
                      fontColor: Colors.white,
                      func: () {
                        submit();
                      },
                    ),
                  ),
                  Divider(),
                  Opacity(
                    opacity: 0.7,
                    child: DefaultButton(
                      text: 'Cancelar', 
                      fontSize: 15.0, 
                        fontColor: Colors.white,
                        backgroundColor: Colors.red,
                        func: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Login())
                          );
                        },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}