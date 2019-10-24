import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({Key key}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nuevo alumno"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            child: Center(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Nombre",
                        hintText: "Ingresa tu nombre"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.people),
                        labelText: "Carrera",
                        hintText: "Tics, IGE, etc..."),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                        icon: Icon(Icons.format_list_numbered),
                        labelText: "Número de control",
                        hintText: "123456787"),
                  ),
                  SizedBox(height: 15,),
                  MaterialButton(
                    child: Text("Registrar",style: TextStyle(color: Colors.white),),
                    onPressed: (){},
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
