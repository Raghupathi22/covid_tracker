import 'package:covid19/DataBase.dart';
import 'package:covid19/screens/HomePage.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primaryColor: primaryBlack
     ),
     home: HomePage(),
    );
  }
}