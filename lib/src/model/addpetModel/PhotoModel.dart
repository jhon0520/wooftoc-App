// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

PhotoModel photoModelFromJson(String str) => PhotoModel.fromJson(json.decode(str));

String photoModelToJson(PhotoModel data) => json.encode(data.toJson());

class PhotoModel {
    String publicId;
    int version;
    String signature;
    int width;
    int height;
    String format;
    String resourceType;
    DateTime createdAt;
    List<dynamic> tags;
    int bytes;
    String type;
    String etag;
    bool placeholder;
    String url;
    String secureUrl;
    String originalFilename;

    PhotoModel({
        this.publicId,
        this.version,
        this.signature,
        this.width,
        this.height,
        this.format,
        this.resourceType,
        this.createdAt,
        this.tags,
        this.bytes,
        this.type,
        this.etag,
        this.placeholder,
        this.url,
        this.secureUrl,
        this.originalFilename,
    });

    factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        publicId: json["public_id"],
        version: json["version"],
        signature: json["signature"],
        width: json["width"],
        height: json["height"],
        format: json["format"],
        resourceType: json["resource_type"],
        createdAt: DateTime.parse(json["created_at"]),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        bytes: json["bytes"],
        type: json["type"],
        etag: json["etag"],
        placeholder: json["placeholder"],
        url: json["url"],
        secureUrl: json["secure_url"],
        originalFilename: json["original_filename"],
    );

    Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "version": version,
        "signature": signature,
        "width": width,
        "height": height,
        "format": format,
        "resource_type": resourceType,
        "created_at": createdAt.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "bytes": bytes,
        "type": type,
        "etag": etag,
        "placeholder": placeholder,
        "url": url,
        "secure_url": secureUrl,
        "original_filename": originalFilename,
    };
}
