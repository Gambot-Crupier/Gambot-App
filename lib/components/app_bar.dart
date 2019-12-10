import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
 // final Color backgroundColor = Colors.indigo[900];
  final Text title;
  final AppBar appBar;
  final List<Widget> widgets;

  const BaseAppBar({Key key, this.title, this.appBar, this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Colors.indigo[900],
      leading: new IconButton(
                              icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
                              onPressed: () => Navigator.of(context).pop(),
                            ), 
      actions: <Widget>[
        new IconButton(
          icon: new Icon(
                          Icons.style,
                          size: 40
                        ),
          tooltip: 'Jogo',
          onPressed: () { 
            print("onPressed");
          },
        ),
        new IconButton(
          icon: new Icon(
                          Icons.stars,
                          size: 40
                        ),
          tooltip: 'Ranking',
          onPressed: () { 
            print("onPressed");
          },
        ),
        new IconButton(
          icon: new Icon(
                          Icons.account_circle,
                          size: 40
                        ),
          tooltip: 'Perfil',
          onPressed: () { 
            print("onPressed");
          },
        ),
        new Divider(
              height: 20,
              indent: 20,
            ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}