import 'package:base_code/utils/consts.dart';
import 'package:flutter/material.dart';

class MartePage extends StatefulWidget {
  MartePage({Key key}) : super(key: key);

  @override
  _MartePageState createState() => _MartePageState();
}

class _MartePageState extends State<MartePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Hola mundo")
    );
  }
}