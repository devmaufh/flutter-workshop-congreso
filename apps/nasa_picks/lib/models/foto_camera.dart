class FotoCamera {
    int id;
    String name;
    int roverId;
    String fullName;

    FotoCamera({
        this.id,
        this.name,
        this.roverId,
        this.fullName,
    });

    factory FotoCamera.fromJson(Map<String, dynamic> json) => FotoCamera(
        id: json["id"],
        name: json["name"],
        roverId: json["rover_id"],
        fullName: json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rover_id": roverId,
        "full_name": fullName,
    };
}
