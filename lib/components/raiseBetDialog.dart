import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambot/style.dart';

class RaiseBetDialog extends StatefulWidget {
  final BuildContext currentContext;

  RaiseBetDialog({
    this.currentContext,
  });

  @override
  State<StatefulWidget> createState() => new _State(currentContext: currentContext);
}

class _State extends State<RaiseBetDialog> {

  BuildContext currentContext;

  _State({this.currentContext}) {}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          content: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: new TextStyle(color: Colors.black, fontSize: 25),
            child: Text('Aumentar aposta')
          )
        );
  }
}