import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/components/change_page_button.dart';
import 'package:gambot/pages/players_list.dart';

class Participate extends StatefulWidget {
  @override
  _ParticipateState createState() => _ParticipateState();
}

class _ParticipateState extends State<Participate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Participação'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Colocar o botao pra clicar para participar aqui'),
              ),
            ),
            ChangePageButton(texto: "Participar da rodada", page: PlayersList(),),
          ],
        ));
  }
}
