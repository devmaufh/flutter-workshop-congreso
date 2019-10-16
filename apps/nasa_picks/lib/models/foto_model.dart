// To parse this JSON data, do
//
//     final foto = fotoFromJson(jsonString);

import 'dart:convert';

import 'package:nasa_picks/models/rover_model.dart';

import 'foto_camera.dart';

Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
    int id;
    int sol;
    FotoCamera camera;
    String imgSrc;
    DateTime earthDate;
    Rover rover;

    Foto({
        this.id,
        this.sol,
        this.camera,
        this.imgSrc,
        this.earthDate,
        this.rover,
    });

    factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        id: json["id"],
        sol: json["sol"],
        camera: FotoCamera.fromJson(json["camera"]),
        imgSrc: json["img_src"],
        earthDate: DateTime.parse(json["earth_date"]),
        rover: Rover.fromJson(json["rover"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sol": sol,
        "camera": camera.toJson(),
        "img_src": imgSrc,
        "earth_date": "${earthDate.year.toString().padLeft(4, '0')}-${earthDate.month.toString().padLeft(2, '0')}-${earthDate.day.toString().padLeft(2, '0')}",
        "rover": rover.toJson(),
    };
}