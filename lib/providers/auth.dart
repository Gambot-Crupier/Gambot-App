import 'dart:convert';
import 'dart:async';
import 'dart:io';
	
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {

  Future<void> signUp(Map<String, String> signUpData) async {    
    try{
      final response = await http.post(
        'http://192.168.0.40:5001/sign-up',
        body: json.encode({"user": signUpData}),
        headers: {"Content-Type": "application/json"},
      );
      
      if(response.statusCode != 200) {
        var error = json.decode(response.body);
        throw new Exception(error['message']);
      }
    } on Exception catch(error) {
      throw error;
    }


    notifyListeners();
  }
}