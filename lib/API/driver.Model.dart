// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'dart:convert';

List<Driver> driverFromJson(String str) => List<Driver>.from(json.decode(str).map((x) => Driver.fromJson(x)));

String driverToJson(List<Driver> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Driver {
    Driver({
        this.id,
        this.name,
        this.descriptions,
        this.phone,
        this.email,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.image,
        this.driverId,
    });

    String id;
    String name;
    String descriptions;
    int phone;
    String email;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    _Image image;
    String driverId;

    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json["_id"],
        name: json["name"],
        descriptions: json["descriptions"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        image: _Image.fromJson(json["image"]),
        driverId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "descriptions": descriptions,
        "phone": phone == null ? null : phone,
        "email": email,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "image": image.toJson(),
        "id": driverId,
    };
}

class _Image {
    _Image({
        this.id,
        this.name,
        this.alternativeText,
        this.caption,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.width,
        this.height,
        this.url,
        this.providerMetadata,
        this.formats,
        this.provider,
        this.related,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.imageId,
    });

    String id;
    String name;
    String alternativeText;
    String caption;
    String hash;
    String ext;
    String mime;
    double size;
    int width;
    int height;
    String url;
    ProviderMetadata providerMetadata;
    Formats formats;
    String provider;
    List<String> related;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String imageId;

    factory _Image.fromJson(Map<String, dynamic> json) => _Image(
        id: json["_id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"].toDouble(),
        width: json["width"],
        height: json["height"],
        url: json["url"],
        providerMetadata: ProviderMetadata.fromJson(json["provider_metadata"]),
        formats: Formats.fromJson(json["formats"]),
        provider: json["provider"],
        related: List<String>.from(json["related"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        imageId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "width": width,
        "height": height,
        "url": url,
        "provider_metadata": providerMetadata.toJson(),
        "formats": formats.toJson(),
        "provider": provider,
        "related": List<dynamic>.from(related.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": imageId,
    };
}

class Formats {
    Formats({
        this.thumbnail,
        this.small,
        this.medium,
    });

    Small thumbnail;
    Small small;
    Small medium;

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: Small.fromJson(json["thumbnail"]),
        small: Small.fromJson(json["small"]),
        medium: json["medium"] == null ? null : Small.fromJson(json["medium"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "small": small.toJson(),
        "medium": medium == null ? null : medium.toJson(),
    };
}

class Small {
    Small({
        this.name,
        this.hash,
        this.ext,
        this.mime,
        this.width,
        this.height,
        this.size,
        this.path,
        this.url,
        this.providerMetadata,
    });

    String name;
    String hash;
    String ext;
    String mime;
    int width;
    int height;
    double size;
    dynamic path;
    String url;
    ProviderMetadata providerMetadata;

    factory Small.fromJson(Map<String, dynamic> json) => Small(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        width: json["width"],
        height: json["height"],
        size: json["size"].toDouble(),
        path: json["path"],
        url: json["url"],
        providerMetadata: ProviderMetadata.fromJson(json["provider_metadata"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "width": width,
        "height": height,
        "size": size,
        "path": path,
        "url": url,
        "provider_metadata": providerMetadata.toJson(),
    };
}

class ProviderMetadata {
    ProviderMetadata({
        this.publicId,
        this.resourceType,
    });

    String publicId;
    ResourceType resourceType;

    factory ProviderMetadata.fromJson(Map<String, dynamic> json) => ProviderMetadata(
        publicId: json["public_id"],
        resourceType: resourceTypeValues.map[json["resource_type"]],
    );

    Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "resource_type": resourceTypeValues.reverse[resourceType],
    };
}

enum ResourceType { IMAGE }

final resourceTypeValues = EnumValues({
    "image": ResourceType.IMAGE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
