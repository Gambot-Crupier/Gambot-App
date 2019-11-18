import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/components/default_button.dart';
import 'package:gambot/pages/signup.page.dart';
import 'package:gambot/pages/participate.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';


class Round extends StatefulWidget {
  @override
  _RoundPageState createState() => _RoundPageState();
}

class _RoundPageState extends State<Round> {
  var money = 1500;

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
            Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(16.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(),
                  DefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.black, fontSize: 20),
                    child: Text(
                      'A RODADA ESTÁ EM'
                    )
                  ),
                  Divider(),
                  DefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: new TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                    child: Text(
                      money.toString()
                    )
                  ),
                  Divider(),
                  SizedBox(
                    width: 160,
                    height: 50, 
                    child: DefaultButton(
                      text: 'Aumentar', 
                      fontSize: 20.0, 
                      fontColor: Colors.white,
                      backgroundColor: Colors.green,
                      func: () {

                      },
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: DefaultButton(
                      text: 'Pagar', 
                      fontSize: 20.0, 
                        fontColor: Colors.white,
                        backgroundColor: Colors.blue,
                        func: () {
                          
                        },
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: DefaultButton(
                      text: 'Fugir', 
                      fontSize: 20.0, 
                        fontColor: Colors.white,
                        backgroundColor: Colors.red,
                        func: () {
                          
                        },
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}