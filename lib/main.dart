import 'package:flutter/material.dart';
import 'package:gambot/pages/login.dart';
import 'package:gambot/pages/round.dart';
import 'package:gambot/pages/players_list.dart';
import 'package:gambot/pages/participate.dart';
import 'package:provider/provider.dart';
import 'package:gambot/providers/auth.dart';
import 'package:gambot/globals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var home = null;
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if(Global.roundId != null && Global.currentGameId != null && Global.playerId != null) {
      home = null;
      home = Round();
    } else if(Global.currentGameId != null && Global.playerId != null) {
      home = null;
      home = PlayersList();
    } else if(Global.playerId != null) {
      home = null;
      home = Participate();
    } else {
      home = null;
      home = Login();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        return MaterialApp(
          title: 'Gambot App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: home
        );
      })
    );
  }
}


