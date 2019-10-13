import 'package:flutter/material.dart';
import 'package:gambot/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:gambot/providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) {
        return MaterialApp(
          title: 'Gambot App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Login(),
        );
      })
    );
  }
}


