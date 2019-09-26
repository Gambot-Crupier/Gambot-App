import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gambot/models/user.dart';
import 'package:http/http.dart';



Future<List<User>> fetchUsers() async {
  final response = await get('https://jsonplaceholder.typicode.com/users');

  if (response.statusCode == 200)
    return User.getListUsers(json.decode(response.body));

  else
    throw Exception('Failed to load User');
}


Widget futureBuilder(Function future, Function callbackFunction) {
  return FutureBuilder<dynamic>(
      future: future(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return callbackFunction(snapshot.data);
          
        else if (snapshot.hasError) 
          return Text("${snapshot.error}");

        return CircularProgressIndicator();
      });
}
