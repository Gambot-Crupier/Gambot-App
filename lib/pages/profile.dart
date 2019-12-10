import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/components/app_bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: BaseAppBar(
          title: Text('Perfil'),
          appBar: AppBar(),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Card(
              child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(20.0),
                  height: 300,
                  child: ListView( 
                    children: <Widget> [
                      
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset("assets/images/logo2.png"),
                            ),
                            Divider(),
                            Text('Fulano',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily: 'McLaren',
                                                  fontSize: 30,
                                                  ),
                                )
                            ],
                          ),
                        ),
                      Divider(),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Rodadas Ganhas',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily: 'McLaren',
                                                  fontSize: 20,
                                                  ),
                                ),
                            Divider(),
                            Text('1',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontFamily: 'McLaren',
                                                  fontSize: 20,
                                                  ),
                                )
                            ],
                          ),
                        ),
                      Divider(),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Dinheiro',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily: 'McLaren',
                                                  fontSize: 20,
                                                  ),
                                ),
                            Divider(),
                            Text('R\$ 10.000,00',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontFamily: 'McLaren',
                                                  fontSize: 20,
                                                  ),
                                )
                            ],
                          ),
                        ),
                      ]
                    ),
                ),
              ),
            )
        ),
      );
  }

}
