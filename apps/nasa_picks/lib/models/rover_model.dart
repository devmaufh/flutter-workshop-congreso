import 'camera_element.dart';

class Rover {
    int id;
    String name;
    DateTime landingDate;
    DateTime launchDate;
    String status;
    int maxSol;
    DateTime maxDate;
    int totalPhotos;
    List<CameraElement> cameras;

    Rover({
        this.id,
        this.name,
        this.landingDate,
        this.launchDate,
        this.status,
        this.maxSol,
        this.maxDate,
        this.totalPhotos,
        this.cameras,
    });

    factory Rover.fromJson(Map<String, dynamic> json) => Rover(
        id: json["id"],
        name: json["name"],
        landingDate: DateTime.parse(json["landing_date"]),
        launchDate: DateTime.parse(json["launch_date"]),
        status: json["status"],
        maxSol: json["max_sol"],
        maxDate: DateTime.parse(json["max_date"]),
        totalPhotos: json["total_photos"],
        cameras: List<CameraElement>.from(json["cameras"].map((x) => CameraElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "landing_date": "${landingDate.year.toString().padLeft(4, '0')}-${landingDate.month.toString().padLeft(2, '0')}-${landingDate.day.toString().padLeft(2, '0')}",
        "launch_date": "${launchDate.year.toString().padLeft(4, '0')}-${launchDate.month.toString().padLeft(2, '0')}-${launchDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "max_sol": maxSol,
        "max_date": "${maxDate.year.toString().padLeft(4, '0')}-${maxDate.month.toString().padLeft(2, '0')}-${maxDate.day.toString().padLeft(2, '0')}",
        "total_photos": totalPhotos,
        "cameras": List<dynamic>.from(cameras.map((x) => x.toJson())),
    };
}