import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/Pages/mainMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fais Ton Carton, l'App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMemu(),
    );
  }
}