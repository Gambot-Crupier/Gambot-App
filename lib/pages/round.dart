import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gambot/components/default_button.dart';
import 'package:gambot/pages/signup.page.dart';
import 'package:gambot/pages/participate.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:gambot/globals.dart';
import 'package:gambot/requests/requests.dart';
import 'package:gambot/requests/requests.dart' as prefix0;


class Round extends StatefulWidget {
  @override
  _RoundPageState createState() => _RoundPageState();
}

class _RoundPageState extends State<Round> {
  var money = 1500;
  var _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    getBet();

    _firebaseMessaging.subscribeToTopic('Gambot');
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print(message['data']['message']);
        if(message['data']['message'] == 'Atualiza'){
          setState((){});
        } else if(message['data']['message'] == 'Redireciona') {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Round())
          );
        }
      },
      onResume: (Map<String, dynamic> message) async {
      },
      onLaunch: (Map<String, dynamic> message) async{
      },
    );
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
                      Global.roundBet.toString()
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