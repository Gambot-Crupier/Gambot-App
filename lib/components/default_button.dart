import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gambot/style.dart';

class DefaultButton extends StatefulWidget {
  // final String text = 'Test';
  // final Color backgroundColor = DefaultStyle.green;
  // final double borderRadius = 20.0;
  // final double fontSize = 20.0;
  // final Color fontColor = Colors.white;
  // final String fontFamily = DefaultStyle.fontFamily;
  // final Function func = () => {};
  final String text;
  final Color backgroundColor;
  final double borderRadius;
  final double fontSize;
  final Color fontColor;
  final String fontFamily;
  final Function func;

  DefaultButton({
    this.text = 'Coloque um texto!',
    this.backgroundColor  = DefaultStyle.green,
    this.borderRadius = 20.0,
    this.fontSize = 20.0,
    this.fontColor = Colors.white,
    this.fontFamily = DefaultStyle.fontFamily,
    this.func,
  });

  @override
  State<StatefulWidget> createState() => new _State(text: text, backgroundColor: backgroundColor, borderRadius: borderRadius,  
                                                      fontSize: fontSize, fontColor: fontColor, fontFamily: fontFamily, func: func);
}

class _State extends State<DefaultButton> {

  String text;
  Color backgroundColor;
  double borderRadius;
  double fontSize;
  Color fontColor;
  String fontFamily;
  Function func;

  _State({this.text, this.backgroundColor, this.borderRadius, this.fontSize, this.fontColor, this.fontFamily, this.func}) {
    this.func ??= () => {};
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.all(10.0),
      color: this.backgroundColor,
      onPressed: this.func,
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(this.borderRadius)),
      child: Text(
        this.text,
        style: TextStyle(
            fontSize: this.fontSize,
            color: this.fontColor,
            fontFamily: this.fontFamily),
        textAlign: TextAlign.center,
      ),
    );
  }
}