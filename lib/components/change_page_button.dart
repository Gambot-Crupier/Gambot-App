import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePageButton extends StatelessWidget {
  final String texto;
  final Widget page;

  ChangePageButton({this.texto, this.page});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
          onPressed: () => _changePage(context, this.page),
          child: Text(
            this.texto,
            style: TextStyle(fontSize: 20)
          ),
        );
  }

  void _changePage(BuildContext context, Widget page) {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => page)
    );
  }
}