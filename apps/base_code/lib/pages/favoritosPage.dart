import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  FavoritosPage({Key key}) : super(key: key);

  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Favoritos"),
    );
  }
}