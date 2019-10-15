// To parse this JSON data, do
//
//     final contactoModel = contactoModelFromJson(jsonString);

import 'dart:convert';

ContactoModel contactoModelFromJson(String str) => ContactoModel.fromJson(json.decode(str));

String contactoModelToJson(ContactoModel data) => json.encode(data.toJson());

class ContactoModel {
    int id;
    String nombre;
    String correo;
    String telefono;
    String ocupacion;

    ContactoModel({
        this.id,
        this.nombre,
        this.correo,
        this.telefono,
        this.ocupacion,
    });

    factory ContactoModel.fromJson(Map<String, dynamic> json) => ContactoModel(
        id: json["id"],
        nombre: json["nombre"],
        correo: json["correo"],
        telefono: json["telefono"],
        ocupacion: json["ocupacion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "correo": correo,
        "telefono": telefono,
        "ocupacion": ocupacion,
    };
}
