import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/components/default_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gambot/components/page_header.dart';
import 'package:gambot/pages/recognize.dart';
import 'package:gambot/pages/round.dart';
import 'package:gambot/models/player.dart';
import 'package:gambot/requests/requests.dart';
import 'package:gambot/requests/requests.dart' as prefix0;
import 'package:gambot/style.dart';

class PlayersList extends StatefulWidget {
  @override
  _PlayersListState createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
  var _firebaseMessaging = new FirebaseMessaging();


  @override
  void initState() {
    super.initState();
    _firebaseMessaging.subscribeToTopic('Gambot');
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        if(message['data']['message'] == 'Atualiza'){
          setState((){});
        } else if(message['data']['message'] == 'Reconhecer') {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Recognize())
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

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ListView(
              children: <Widget> [
                // Header
                PageHeader(texto: 'PARTICIPANTES',),
                
                // Users List
                Center(
                  child: Card(
                    child: Container(
                        width: 300,
                        padding: const EdgeInsets.all(20.0),
                        height: queryData.size.height * 0.5,
                        child: builder(fetchPlayersInGame, usersList),
                      ),
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Opacity(
                        opacity: 0.5,
                        child: DefaultButton(
                          text: 'Voltar', 
                          fontSize: 10.0, 
                          backgroundColor: Colors.red[300], 
                          fontColor: Colors.black,
                          func: () => voltar(context),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: DefaultButton(
                          text: 'COMEÇAR', 
                          fontSize: 15.0,
                          func: ()=> goToRecognition(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          )
        ),
      );
  }

  Widget usersList(data) {
    List<Player> players = Player.getListPlayers(data['players']);
    const TextStyle style = TextStyle(fontSize: 18, color: Colors.black, fontFamily: DefaultStyle.fontFamily);

    return ListView.separated(
        itemCount: players.length,
        
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              (index+1).toString() + '       ' + players[index].name, 
              style: style,
            ),
          );
        },
        
        separatorBuilder: (context, index) {
          return Divider();
        },
      );   
  }


  void voltar(BuildContext context) async {
    try{
        await dropGame();
        Navigator.pop(context);
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
      }
  }


  void goToRecognition(BuildContext context) async {
    try{
        await startGame();
      } on Exception catch (error) {
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Recognize())
        );
      }
  }

}
