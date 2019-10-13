import 'dart:convert';
import 'dart:async';
	
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {

  Future<void> signUp(Map<String, String> signUpData) async {    
    print(signUpData);
    try{
      final response = await http.post(
        'http://10.0.2.2:5001/sign-up',
        body: json.encode({"user": signUpData}),
        headers: {"Content-Type": "application/json"},
      );

      print(response);
    } on Exception catch(error) {
      print('erro');
      print(error);
    }

    print('oi2');

    notifyListeners();
  }
}