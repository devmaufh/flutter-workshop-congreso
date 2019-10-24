import 'package:flutter/material.dart';
import 'package:space/formulario.dart';
import 'package:space/home.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'registro': (BuildContext context) =>RegistroPage(),
        'home'  : ( BuildContext context ) => HomePage(),
      },
      initialRoute: 'home',
      title: 'Material App',
    );
  }
}