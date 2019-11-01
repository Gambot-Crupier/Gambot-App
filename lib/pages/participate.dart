import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/pages/players_list.dart';
import 'package:gambot/style.dart';
import 'package:gambot/requests/requests.dart';

class Participate extends StatefulWidget {
  @override
  _ParticipateState createState() => _ParticipateState();
}

class _ParticipateState extends State<Participate> {

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              child: SizedBox(
                width: 230,
                child: RaisedButton(
                    padding: const EdgeInsets.all(20.0),
                    color: DefaultStyle.green,
                    onPressed: () => participar(context),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    child: Text(
                      'PARTICIPAR DO JOGO',
                      style: TextStyle(
                        fontSize: 30, 
                        color: Colors.white, 
                        fontFamily: DefaultStyle.fontFamily
                        ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ),
            ),
          ),
        )
      );
  }


  void participar(BuildContext context) async {
    try{
        await participateGame();
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlayersList())
        );
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
}
