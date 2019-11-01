import 'dart:convert';
import 'dart:async';
	
import 'package:flutter/widgets.dart';
import 'package:gambot/globals.dart';
import 'package:gambot/requests/URLs.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {

  Future<void> signUp(Map<String, String> signUpData) async {    
    try{
      final response = await http.post(
        URLs.ipBernardoPlayers + 'sign-up',
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

  Future<void> login(Map<String, String> loginData) async {
    try{
      final response = await http.post(
        URLs.ipBernardoPlayers + 'sign-in',
        body: json.encode({"user": loginData}),
        headers: {"Content-Type": "application/json"},
      );

      if(response.statusCode != 200) {
        var error = json.decode(response.body);
        throw new Exception(error['message']);
      }
      else 
        Global.playerId = json.decode(response.body)['user_id'];
      
    } on Exception catch(error) {
      throw error;
    }
  }
}