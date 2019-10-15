

import 'dart:async';

import 'package:app1/models/contacto_model.dart';
import 'package:app1/providers/database.dart';

class ContactosBloc {
 final _contactosController = StreamController<List<ContactoModel>>.broadcast();

 Stream<List<ContactoModel>> get contactosStream => _contactosController.stream;

 void cargaContactos()async{
   List<dynamic> data = await DatabaseProvider.db.getContactos();
   if(data.length>0){
        _contactosController.sink.add(data);
   }
 }
 void insertContacto(ContactoModel model)async{

   await DatabaseProvider.db.insertContacto(model);
 }
 void deleteContacto(ContactoModel model) async{
   await DatabaseProvider.db.deleteContacto(model);
 }
 void updateContacto( ContactoModel model ) async{
   await DatabaseProvider.db.updateContacto(model);
 }
}