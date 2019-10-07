import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/pages/players_list.dart';

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
                    color: Color.fromRGBO(52, 121, 68, 0.7),
                    onPressed: () => participar(context),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                    child: Text(
                      'PARTICIPAR DA RODADA',
                      style: TextStyle(fontSize: 30, color: Colors.white, fontFamily: 'McLaren'),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ),
            ),
          ),
        )
      );
  }

  void participar(BuildContext context) {
    // Realiza Logica para participar

    // Em caso de sucesso:
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => PlayersList())
    );
  }
}
