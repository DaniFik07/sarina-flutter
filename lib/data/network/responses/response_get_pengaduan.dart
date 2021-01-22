/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
//
//     final responseGetAllPengaduan = responseGetAllPengaduanFromJson(jsonString);

import 'dart:convert';

ResponseGetAllPengaduan responseGetAllPengaduanFromJson(String str) => ResponseGetAllPengaduan.fromJson(json.decode(str));

String responseGetAllPengaduanToJson(ResponseGetAllPengaduan data) => json.encode(data.toJson());

class ResponseGetAllPengaduan {
  ResponseGetAllPengaduan({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponseGetAllPengaduan.fromJson(Map<String, dynamic> json) => ResponseGetAllPengaduan(
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
    this.idPengaduan,
    this.idUser,
    this.judul,
    this.lat,
    this.lng,
    this.deskripsiKejadian,
    this.tanggalKejadian,
    this.status,
    this.createdAt,
    this.image,
  });

  int idPengaduan;
  int idUser;
  String judul;
  String lat;
  String lng;
  String deskripsiKejadian;
  DateTime tanggalKejadian;
  String status;
  DateTime createdAt;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idPengaduan: json["idPengaduan"] == null ? null : json["idPengaduan"],
    idUser: json["idUser"] == null ? null : json["idUser"],
    judul: json["judul"] == null ? null : json["judul"],
    lat: json["lat"] == null ? null : json["lat"],
    lng: json["lng"] == null ? null : json["lng"],
    deskripsiKejadian: json["deskripsiKejadian"] == null ? null : json["deskripsiKejadian"],
    tanggalKejadian: json["tanggalKejadian"] == null ? null : DateTime.parse(json["tanggalKejadian"]),
    status: json["status"] == null ? null : json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "idPengaduan": idPengaduan == null ? null : idPengaduan,
    "idUser": idUser == null ? null : idUser,
    "judul": judul == null ? null : judul,
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
    "deskripsiKejadian": deskripsiKejadian == null ? null : deskripsiKejadian,
    "tanggalKejadian": tanggalKejadian == null ? null : tanggalKejadian.toIso8601String(),
    "status": status == null ? null : status,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "image": image == null ? null : image,
  };
}
