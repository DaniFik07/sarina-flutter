// To parse this JSON data, do
//
//     final responsePic = responsePicFromJson(jsonString);

import 'dart:convert';

ResponsePic responsePicFromJson(String str) => ResponsePic.fromJson(json.decode(str));

String responsePicToJson(ResponsePic data) => json.encode(data.toJson());

class ResponsePic {
  ResponsePic({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponsePic.fromJson(Map<String, dynamic> json) => ResponsePic(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.provincesId,
    this.regenciesId,
    this.fullname,
    this.email,
    this.noTelpon,
    this.alamat,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int provincesId;
  int regenciesId;
  String fullname;
  String email;
  String noTelpon;
  String alamat;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    provincesId: json["provinces_id"] == null ? null : json["provinces_id"],
    regenciesId: json["regencies_id"] == null ? null : json["regencies_id"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    email: json["email"] == null ? null : json["email"],
    noTelpon: json["no_telpon"] == null ? null : json["no_telpon"],
    alamat: json["alamat"] == null ? null : json["alamat"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "provinces_id": provincesId == null ? null : provincesId,
    "regencies_id": regenciesId == null ? null : regenciesId,
    "fullname": fullname == null ? null : fullname,
    "email": email == null ? null : email,
    "no_telpon": noTelpon == null ? null : noTelpon,
    "alamat": alamat == null ? null : alamat,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
