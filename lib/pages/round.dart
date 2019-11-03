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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_login.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.clear),
          ),
        ),
        padding: EdgeInsets.only(top: 130, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            Divider(),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 160, 
                    child: DefaultButton(
                      text: 'Aumentar', 
                      fontSize: 15.0, 
                      fontColor: Colors.white,
                      backgroundColor: Colors.green,
                      func: () {

                      },
                    ),
                  ),
                  Divider(),
                  Opacity(
                    opacity: 0.7,
                    child: DefaultButton(
                      text: 'Pagar', 
                      fontSize: 15.0, 
                        fontColor: Colors.white,
                        backgroundColor: Colors.red,
                        func: () {
                          
                        },
                    ),
                  ),
                  Divider(),
                  Opacity(
                    opacity: 0.7,
                    child: DefaultButton(
                      text: 'Fugir', 
                      fontSize: 15.0, 
                        fontColor: Colors.white,
                        backgroundColor: Colors.red,
                        func: () {
                          
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