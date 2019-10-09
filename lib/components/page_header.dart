import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambot/style.dart';

class PageHeader extends StatelessWidget {
  final String texto;

  PageHeader({this.texto});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: SizedBox(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              color: DefaultStyle.green,
              child: Text(
                this.texto,
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: DefaultStyle.fontFamily),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
