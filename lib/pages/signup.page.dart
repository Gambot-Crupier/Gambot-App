import 'package:flutter/material.dart';
import 'package:gambot/components/default_button.dart';
import 'package:gambot/pages/login.dart';

class SignupPage extends StatelessWidget {
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
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment(0.5, 1.15),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage("assets/images/user.png"),
                  fit: BoxFit.fitHeight,
                )
              ),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.indigo[900],
                  border: Border.all(
                    width: 2.0,
                    color: Colors.white
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(56)
                  )
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Divider(),
            TextFormField(
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
                      func: () {},
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