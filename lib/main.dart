import 'package:flutter/material.dart';
import './pages/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID-19 GH',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}