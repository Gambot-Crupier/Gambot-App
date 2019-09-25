import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gambot/models/user.dart';
import 'package:http/http.dart';



Future<User> fetchUser() async {
  final response =
      await get('https://jsonplaceholder.typicode.com/users/1');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return User.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load User');
  }
}
