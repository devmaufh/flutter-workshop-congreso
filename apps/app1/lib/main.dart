import 'package:app1/pages/register_page.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contactos',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: RegisterPage(),
    );
  }
}

