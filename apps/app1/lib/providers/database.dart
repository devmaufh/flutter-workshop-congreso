import 'dart:io';

import 'package:app1/models/contacto_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static Database _database;
  //Singleton
  static final DatabaseProvider db = DatabaseProvider._();
  DatabaseProvider._();

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB()async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'contacts.db');
    return await openDatabase(path, version: 1, onOpen:(db){},onCreate: (Database db, int version)async{
      await db.execute("CREATE TABLE contactos(id INTEGER PRIMARY KEY, nombre TEXT, correo TEXT, telefono TEXT, ocupacion TEXT)");
    });
  }

  getContactos()async{
    final db = await database;
    final res = await db.query('contactos');
    return res.isNotEmpty ? res.map((contacto)=> ContactoModel.fromJson(contacto)).toList() : [];    
  }

  insertContacto( ContactoModel model ) async{
    final db = await database;
    final res = await db.insert('contactos', model.toJson());
    return res;
  }
  updateContacto( ContactoModel model ) async {
    final db = await database;
    final res = await db.update('contactos', model.toJson(), where: "id = ?", whereArgs: [model.id] );
    return res;
  }
  deleteContacto ( ContactoModel model ) async {
    final db = await database;
    final res = await db.delete('contactos',where: 'id = ?', whereArgs: [model.id]);
    return res;
  }
}