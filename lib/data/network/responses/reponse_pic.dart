/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
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
    this.levelId,
    this.fullname,
    this.username,
    this.email,
    this.password,
    this.noTelpon,
    this.alamat,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
  });

  int id;
  int provincesId;
  int regenciesId;
  int levelId;
  String fullname;
  String username;
  String email;
  String password;
  int noTelpon;
  String alamat;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic token;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    provincesId: json["provinces_id"] == null ? null : json["provinces_id"],
    regenciesId: json["regencies_id"] == null ? null : json["regencies_id"],
    levelId: json["level_id"] == null ? null : json["level_id"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    noTelpon: json["no_telpon"] == null ? null : json["no_telpon"],
    alamat: json["alamat"] == null ? null : json["alamat"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "provinces_id": provincesId == null ? null : provincesId,
    "regencies_id": regenciesId == null ? null : regenciesId,
    "level_id": levelId == null ? null : levelId,
    "fullname": fullname == null ? null : fullname,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "no_telpon": noTelpon == null ? null : noTelpon,
    "alamat": alamat == null ? null : alamat,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "token": token,
  };
}
