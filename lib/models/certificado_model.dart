class Certificado {
    final Image logo;
    final Image image;
    final String id;
    final String title;
    final String hoverTitle;
    final String description;
    final String link;
    final Estado estado;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    Certificado({
        required this.logo,
        required this.image,
        required this.id,
        required this.title,
        required this.hoverTitle,
        required this.description,
        required this.link,
        required this.estado,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Certificado.fromJson(Map<String, dynamic> json) => Certificado(
        logo: Image.fromJson(json["logo"]),
        image: Image.fromJson(json["image"]),
        id: json["_id"],
        title: json["title"],
        hoverTitle: json["hover_title"],
        description: json["description"],
        link: json["link"],
        estado: estadoValues.map[json["estado"]]!,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "logo": logo.toJson(),
        "image": image.toJson(),
        "_id": id,
        "title": title,
        "hover_title": hoverTitle,
        "description": description,
        "link": link,
        "estado": estadoValues.reverse[estado],
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

enum Estado {
    ACTIVO,
    INACTIVO
}

final estadoValues = EnumValues({
    "ACTIVO": Estado.ACTIVO,
    "INACTIVO": Estado.INACTIVO
});

class Image {
    final String secureUrl;
    final String publicId;

    Image({
        required this.secureUrl,
        required this.publicId,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        secureUrl: json["secure_url"],
        publicId: json["public_id"],
    );

    Map<String, dynamic> toJson() => {
        "secure_url": secureUrl,
        "public_id": publicId,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
