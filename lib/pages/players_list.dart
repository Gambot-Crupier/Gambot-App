import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayersList extends StatefulWidget {
  @override
  _PlayersListState createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Usuários'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Exemplo de listagem de usuários com requests async'),
              ),
            ),
          ],
        ));
  }
}
