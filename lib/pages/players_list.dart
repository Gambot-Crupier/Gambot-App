import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/components/page_header.dart';
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
                        child: usersList(),
                      ),
                  ),
                ),
                
                // Bottom Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    child: SizedBox(
                      width: 160,
                      child: RaisedButton(
                          padding: const EdgeInsets.all(10.0),
                          color: DefaultStyle.green,
                          onPressed: () => {},
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                          child: Text(
                            'COMEÇAR',
                            style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: DefaultStyle.fontFamily),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          )
        ),
      );
  }

  Widget usersList() {
    List<String> userNames = ['Bernardo', 'Bruno', 'Ateldy', 'Matheus', 'Gambot', 'Gambeiro', 'Gambiarra']; 
    const TextStyle style = TextStyle(fontSize: 18, color: Colors.black, fontFamily: DefaultStyle.fontFamily);

    return ListView.separated(
        itemCount: userNames.length,
        
        itemBuilder: (context, index) {
          print('\n\nalou');
          print(context);
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
