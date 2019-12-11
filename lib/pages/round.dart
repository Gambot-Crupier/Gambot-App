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

import '../style.dart';


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
    getPlayerActions();
    getPlayerRanking();

    _firebaseMessaging.subscribeToTopic('Gambot');
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        await getRoundId();
        await getBet();
        await getCurrentPlayer();
        await getPlayerMoney();
        await getPlayerActions();
        await getPlayerRanking();
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
        } else if (message['data']['message'] == 'NovoRound') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Um novo round irá iniciar!'),
                content: Text('Coloque de volta suas cartas no Gambot e espere que elas sejam distribuídas!')
              );
            },
          );
        } else if (message['data']['message'] == 'Endgame') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Temos um vencedor do jogo!'),
                content: Text('O vencedor da partida que ficou com todo o dinheiro foi ' + message['data']['winner'] + '! Parabéns!')
              );
            },
          );
          Future.delayed(const Duration(seconds: 25), () => "25");
          Global.currentGameId = null;
          Global.playerMoney = null;
          Global.roundId = null;
          Global.roundBet = null;
        } else if (message['data']['message'] == 'Endround') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Acabou a rodada!'),
                content: Text('O jogador que venceu a partida com a maior sequência foi ' + message['data']['winner'] + '! Parabéns!')
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
    print('aquiiiii');
    Future.delayed(const Duration(seconds: 10), () => "10");
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('Round'),
          backgroundColor: Colors.indigo[900],
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Ações"),
              Tab(text: "Jogadores"),
              Tab(text: "Ranking")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            playerActions(),
            playerActionsTable(),
            playerRanking()
          ],
        )
      )
    );
  }

  Widget playerActions() {
    if(Global.playerId == Global.playerTurnId) {
      return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
            padding: EdgeInsets.only(top: 70, left: 40, right: 40),
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
          );
    } else {
      return Container(
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
                  borderRadius: new BorderRadius.circular(30.0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Divider(),
                    DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: new TextStyle(color: Colors.black, fontSize: 20, fontFamily: DefaultStyle.fontFamily),
                      child: Text(
                        'Espere a sua vez'
                      )
                    ),
                    Divider()
                  ],
                ),
              ),
            ],
          ),
        );
    }    
  }

  Widget playerRanking() {
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
            ),
          ),
          padding: EdgeInsets.only(top: 40, left: 40, right: 40),
          child: Center(
            child: Card(
              child: Container(
                width: 300,
                height: 350,
                padding: const EdgeInsets.all(5.0),
                child: playerRankingItems()
              )
            )
          )
        );
  }

  Widget playerRankingItems() {
    const TextStyle style = TextStyle(fontSize: 16, color: Colors.black, fontFamily: DefaultStyle.fontFamily);

    return ListView.separated(
        itemCount: Global.playerRanking.length,

        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              (index+1).toString() + ' - ' + Global.playerRanking[index]['player_name'], 
              style: style,
            ),
            subtitle: Text(
              'Dinheiro: ' + Global.playerRanking[index]['money'].toString(),
              style: new TextStyle(fontWeight: FontWeight.normal, fontFamily: 'McLaren'),
            )
          );
        },
        
        separatorBuilder: (context, index) {
          return Divider();
        },
      ); 
  }

  Widget playerActionsTable() {
    return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
            ),
          ),
          padding: EdgeInsets.only(top: 40, left: 40, right: 40),
          child: Center(
            child: Card(
              child: Container(
                width: 300,
                height: 350,
                padding: const EdgeInsets.all(5.0),
                child: playerActionsItems()
              )
            )
          )
        );
  }

  Widget playerActionsItems() {
    const TextStyle style = TextStyle(fontSize: 16, color: Colors.black, fontFamily: DefaultStyle.fontFamily);

    return ListView.separated(
        itemCount: Global.playerActions.length,

        itemBuilder: (context, index) {

          return ListTile(
            title: Text(
              (index+1).toString() + ' - ' + Global.playerActions[index]['name'], 
              style: style,
            ),
            subtitle: Text('Aposta: ' + Global.playerActions[index]['action'], 
              style: new TextStyle(fontWeight: FontWeight.normal, fontFamily: 'McLaren'),
            ),
          );
        },
        
        separatorBuilder: (context, index) {
          return Divider();
        },
      ); 
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
    int divisoes = (10000 - valorApostaAtual)~/100;

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
                        max: 10000,
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
                          if(_value <= valorApostaAtual) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("Aumente a aposta"),
                                  content: new Text("Se deseja continuar no jogo, pague a aposta. Senão, fuja!")
                                );
                              },
                            );
                          } else {
                            raiseBet(_value);
                            Navigator.pop(context);
                          }
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