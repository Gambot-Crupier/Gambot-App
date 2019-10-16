import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/components/default_button.dart';
import 'package:gambot/components/page_header.dart';
import 'package:gambot/requests/requests.dart';
import 'package:gambot/style.dart';

class PlayersList extends StatefulWidget {
  @override
  _PlayersListState createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
  
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
                        child: futureBuilder(fetchPlayers, usersList),
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
                          text: 'Voltar!!', 
                          fontSize: 10.0, 
                          backgroundColor: Colors.red[300], 
                          fontColor: Colors.black,
                          func: () => Navigator.pop(context),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        child: DefaultButton(
                          text: 'COMEÇAR', 
                          fontSize: 15.0,
                          func: ()=>{},
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
    print('\nDados: ');
    print(data);

    List<String> userNames = ['Bernardo', 'Bruno', 'Ateldy', 'Matheus', 'Gambot', 'Gambeiro', 'Gambiarra']; 
    const TextStyle style = TextStyle(fontSize: 18, color: Colors.black, fontFamily: DefaultStyle.fontFamily);

    return ListView.separated(
        itemCount: userNames.length,
        
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              (index+1).toString() + '       ' + userNames[index], 
              style: style,
            ),
          );
        },
        
        separatorBuilder: (context, index) {
          return Divider();
        },
      );
      
  }


}
