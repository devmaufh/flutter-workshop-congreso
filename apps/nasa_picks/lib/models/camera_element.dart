import 'dart:io';

class CameraElement {
    String name;
    String fullName;

    CameraElement({
        this.name,
        this.fullName,
    });

    factory CameraElement.fromJson(Map<String, dynamic> json) => CameraElement(
        name: json["name"],
        fullName: json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "full_name": fullName,
    };
}
