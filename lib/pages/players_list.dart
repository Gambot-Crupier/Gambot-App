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
            FutureBuilder<User>(
                future: fetchUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.name);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                }),
          ],
        ));
  }

  Widget postList(data) {
    print(data);
  }
}
