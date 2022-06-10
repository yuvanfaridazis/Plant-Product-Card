import 'package:flutter/material.dart';
import 'package:plant_card/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Widget home = HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home,
    );
  }


}

