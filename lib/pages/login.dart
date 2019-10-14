import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/components/default_button.dart';
import 'package:gambot/pages/signup.page.dart';
import 'package:gambot/pages/participate.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _loginData = {
    'email': '',
    'password': ''
  };

  Future<void> submit() async {

    _formKey.currentState.save();

    try{
      await Provider.of<Auth>(context, listen: false).login(_loginData);
      login(context);
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
            content: Text("Erro ao logar, tente novamente!")
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
          padding: EdgeInsets.only(top: 60, left: 40, right: 40),
          child: ListView(
            children: <Widget>[
              SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/images/logo.png"),
            ),
              Divider(),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        onSaved: (value) {
                          _loginData['email'] = value;
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
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.white, fontFamily: 'McLaren')
                        ),
                      ),
                      Divider(),
                      TextFormField(
                        onSaved: (value) {
                          _loginData['password'] = value;
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
                          labelStyle: TextStyle(color: Colors.white, fontFamily: 'McLaren'))
                        ),
                      Divider(),
                    ],
                  ),
                )
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: 160,  
                      child: DefaultButton(
                        text: 'Jogar!', 
                        fontSize: 15.0, 
                        fontColor: Colors.white,
                        func: () {
                          submit();
                        }
                      ),
                    ),
                    Divider(),
                    Opacity(
                      opacity: 0.7,
                      child: DefaultButton(                  
                        text: 'Cadastre-se', 
                        fontSize: 15.0, 
                        backgroundColor: Colors.indigo[900], 
                        fontColor: Colors.white,
                        func: () => cadastro(context),
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

  void login(BuildContext context) {
    // Realiza Logica para Login

    // Em caso de sucesso:
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => Participate())
    );
  }

  void cadastro(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPage(),
      ),
    );            
  }
}
