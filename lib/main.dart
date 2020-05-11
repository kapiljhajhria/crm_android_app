import 'package:crmandroidapp/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins",
        primaryColor: Color.fromRGBO(255, 122, 122, 1.0),
        accentColor: Color.fromRGBO(56, 204, 140, 1.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LogInScreen(),
    );
  }
}


