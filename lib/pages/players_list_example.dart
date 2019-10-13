import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/models/user.dart';
import 'package:gambot/requests/requests.dart';

class PlayersList extends StatefulWidget {
  @override
  _PlayersListState createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
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
                child:
                    Text('Exemplo de listagem de usuários com requests async'),
              ),
            ),
            futureBuilder(fetchUsers, usersList),
          ],
        ));
  }

  Widget usersList(List<User> data) {

    List<Widget> usersList = new List<Widget>();

    data.forEach((user) => {
      usersList.add(
        Center(
          child: Text(user.name),
        )
      )
    });

    return Column(children: usersList);
  }
}
