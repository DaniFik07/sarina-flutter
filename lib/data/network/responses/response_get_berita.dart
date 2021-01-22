/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
// To parse this JSON data, do
//
//     final responseGetBerita = responseGetBeritaFromJson(jsonString);

import 'dart:convert';

ResponseGetBerita responseGetBeritaFromJson(String str) => ResponseGetBerita.fromJson(json.decode(str));

String responseGetBeritaToJson(ResponseGetBerita data) => json.encode(data.toJson());

class ResponseGetBerita {
  ResponseGetBerita({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponseGetBerita.fromJson(Map<String, dynamic> json) => ResponseGetBerita(
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
    this.usersId,
    this.judul,
    this.lat,
    this.lng,
    this.deskripsi,
    this.image,
    this.status,
    this.tanggal,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int usersId;
  String judul;
  String lat;
  String lng;
  String deskripsi;
  String image;
  String status;
  DateTime tanggal;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    usersId: json["users_id"] == null ? null : json["users_id"],
    judul: json["judul"] == null ? null : json["judul"],
    lat: json["lat"] == null ? null : json["lat"],
    lng: json["lng"] == null ? null : json["lng"],
    deskripsi: json["deskripsi"] == null ? null : json["deskripsi"],
    image: json["image"] == null ? null : json["image"],
    status: json["status"] == null ? null : json["status"],
    tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "users_id": usersId == null ? null : usersId,
    "judul": judul == null ? null : judul,
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
    "deskripsi": deskripsi == null ? null : deskripsi,
    "image": image == null ? null : image,
    "status": status == null ? null : status,
    "tanggal": tanggal == null ? null : tanggal.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
