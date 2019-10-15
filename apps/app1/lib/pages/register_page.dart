import 'package:app1/bloc/contactos_bloc.dart';
import 'package:app1/models/contacto_model.dart';
import 'package:app1/providers/database.dart';
import 'package:app1/utils/Validaciones.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/database.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  ContactoModel contactoModel = new ContactoModel(
      correo: '', id: null, nombre: "", ocupacion: "", telefono: "");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ContactoModel contactoData =
        ModalRoute.of(context).settings.arguments;

    if (contactoData != null) {
      print("ASies");
      contactoModel = contactoData;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Nuevo contacto"),
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(20),
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    _construyeTextNombre(),
                    SizedBox(
                      height: 15,
                    ),
                    _construyeTextEmail(),
                    SizedBox(
                      height: 15,
                    ),
                    _construyeTextTelefono(),
                    SizedBox(
                      height: 15,
                    ),
                    _construyeTextOcupacion(),
                    SizedBox(
                      height: 15,
                    ),
                    _construyeBoton(),
                  ],
                ),
              )),
        ));
  }

  Widget _construyeTextNombre() {
    return TextFormField(
      initialValue: contactoModel.nombre,
      decoration: InputDecoration(
        hintText: "Ej. Juan perez",
        labelText: "Nombre",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.person),
      ),
      maxLines: null,
      onSaved: (nombre) => contactoModel.nombre = nombre,
      validator: (titulo) {
        if (Validaciones.isEmpty(titulo)) return "Ingresa un nombre válido";
        if (Validaciones.validateLength60(titulo)) return "Nombre muy largo";
        return null;
      },
    );
  }

  Widget _construyeTextEmail() {
    return TextFormField(
      initialValue: contactoModel.correo,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Ej. juanito@example.com",
        labelText: "Email",
        border: OutlineInputBorder(borderSide: BorderSide()),
        prefixIcon: Icon(Icons.email),
      ),
      onSaved: (email) {
        contactoModel.correo = email;
      },
      validator: (email) {
        if (Validaciones.isEmpty(email)) return "Ingresa un correo";
        if (Validaciones.validateEmail(email))
          return "Ingresa un correo válido";
        return null;
      },
    );
  }

  Widget _construyeTextTelefono() {
    return TextFormField(
      initialValue: contactoModel.telefono,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: "Ej. 4612180322",
          labelText: "Telefono",
          border: OutlineInputBorder(borderSide: BorderSide()),
          prefixIcon: Icon(Icons.phone)),
      onSaved: (tel) {
        contactoModel.telefono = tel;
      },
      validator: (tel) {
        if (Validaciones.isEmpty(tel)) return "Ingresa un teléfono";
        if (Validaciones.validateNumber(tel)) return "Teléfono inválido";

        return null;
      },
    );
  }

  Widget _construyeTextOcupacion() {
    return TextFormField(
      initialValue: contactoModel.ocupacion,
      decoration: InputDecoration(
        hintText: "Ej. Carpintero en ...",
        labelText: "Ocupación",
        prefixIcon: Icon(Icons.work),
        border: OutlineInputBorder(borderSide: BorderSide()),
      ),
      onSaved: (ocupacion) {
        contactoModel.ocupacion = ocupacion;
      },
      validator: (ocpacion) {
        if (Validaciones.isEmpty(ocpacion)) return "Ingresa un valor correcto";
        return null;
      },
    );
  }

  Widget _construyeBoton() {
    return MaterialButton(
      minWidth: double.infinity,
      color: Colors.purple,
      child: Text(
        "Guardar",
        style: TextStyle(color: Colors.white),
      ),
      onPressed:_saveData,
    );
  }

  _saveData() {
    final bloc = ContactosBloc();
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    
    //TODO: Guardar datos en DB
    print(contactoModel.toJson());
    if(contactoModel.id==null){
      bloc.insertContacto(contactoModel);
    }else{
      bloc.updateContacto(contactoModel);
    }
    Navigator.pop(context);
    //TODO: Editar datos 
  }
}
