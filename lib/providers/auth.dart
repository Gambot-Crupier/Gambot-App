import 'dart:convert';
import 'dart:async';
	
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {

  Future<void> signUp(Map<String, String> signInData) async {
    var requestUrl = 'http://localhost:5001/api/sign-up';
    
    final response = await http.post(
      requestUrl,
      body: json.encode({"user": signInData}),
      headers: {"Content-Type": "application/json"},
    );

    if(response.statusCode == 200) {
      print('vish');
    } else {
      print('eita');
    }
  }
}