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
  var _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    
    getCurrentPlayer();
    getBet();
    getPlayerMoney();

    _firebaseMessaging.subscribeToTopic('Gambot');
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        getBet();
        getCurrentPlayer();
        getPlayerMoney();
        setState((){});

        if(message['data']['message'] == 'Fugiram') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Acabou a rodada!'),
                content: Text('Como todos os jogadores fugiram, o vencedor é o jogador(a) ' + message['data']['winner'])
              );
            },
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
    print(Global.playerId);
    print(Global.playerTurnId);
    if(Global.playerId == Global.playerTurnId){
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
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
                    DefaultTextStyle(
                      textAlign: TextAlign.left,
                      style: new TextStyle(color: Colors.black, fontSize: 20),
                      child: Text(
                        'Você possui'
                      )
                    ),
                    Divider(),
                    DefaultTextStyle(
                      textAlign: TextAlign.right,
                      style: new TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      child: Text(
                        Global.playerMoney.toString()
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
                          raiseBetDialog(context);
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
                            payBet();
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
                            leaveMatch();
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
    } else {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
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
                        'Espere a sua vez'
                      )
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

  Widget margin(Widget wid) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      child: wid,
    );
  }

  void raiseBetDialog(BuildContext context) async {
    
    // Recuperar das APIs
    double valorApostaAtual = Global.roundBet;
    double dinheiroMaximoJogador = Global.playerMoney.toDouble();
    int divisoes = (dinheiroMaximoJogador - valorApostaAtual)~/100;

    double _value = valorApostaAtual;

    showDialog(
		context: context,
		builder: (BuildContext context) {
			return AlertDialog(
				content: StatefulBuilder(
					builder: (BuildContext context, StateSetter setState) {
						return Container(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  margin(Text('Aumente a aposta!')),
                  margin(Slider(
                        value: _value,
                        min: valorApostaAtual,
                        max: dinheiroMaximoJogador,
                        divisions: divisoes,
                        activeColor: Colors.red,
                        inactiveColor: Colors.black,
                        label: 'R\$ $_value',
                        onChanged: (double newValue) {
                          setState(() {
                            _value = newValue.round().toDouble();
                          });
                        },
                    )),
                    margin(SizedBox(
                    width: 160,
                    height: 50,
                    child: DefaultButton(
                      text: 'Aumentar', 
                      fontSize: 20.0, 
                        fontColor: Colors.white,
                        backgroundColor: Colors.green,
                        func: () {
                          raiseBet(_value);
                          Navigator.pop(context);
                        },
                    ))),
                    margin(SizedBox(
                    width: 160,
                    height: 50,
                    child: DefaultButton(
                      text: 'Voltar', 
                      fontSize: 15.0, 
                        fontColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        func: () => {
                          Navigator.pop(context)
                        },
                    ))),
                ]
            ));
					},
				),
			);
		});                 
  }
}