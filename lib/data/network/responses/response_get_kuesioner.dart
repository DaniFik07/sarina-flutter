/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

// To parse this JSON data, do
//
//     final responseGetKuesioner = responseGetKuesionerFromJson(jsonString);

import 'dart:convert';

ResponseGetKuesioner responseGetKuesionerFromJson(String str) => ResponseGetKuesioner.fromJson(json.decode(str));

String responseGetKuesionerToJson(ResponseGetKuesioner data) => json.encode(data.toJson());

class ResponseGetKuesioner {
  ResponseGetKuesioner({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory ResponseGetKuesioner.fromJson(Map<String, dynamic> json) => ResponseGetKuesioner(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.jenisBangunan,
    this.jenisKepemilikan,
    this.kondisiBangunan,
    this.sumber,
  });

  JenisBangunan jenisBangunan;
  JenisBangunan jenisKepemilikan;
  JenisBangunan kondisiBangunan;
  JenisBangunan sumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    jenisBangunan: json["jenis_bangunan"] == null ? null : JenisBangunan.fromJson(json["jenis_bangunan"]),
    jenisKepemilikan: json["jenis_kepemilikan"] == null ? null : JenisBangunan.fromJson(json["jenis_kepemilikan"]),
    kondisiBangunan: json["kondisi_bangunan"] == null ? null : JenisBangunan.fromJson(json["kondisi_bangunan"]),
    sumber: json["sumber"] == null ? null : JenisBangunan.fromJson(json["sumber"]),
  );

  Map<String, dynamic> toJson() => {
    "jenis_bangunan": jenisBangunan == null ? null : jenisBangunan.toJson(),
    "jenis_kepemilikan": jenisKepemilikan == null ? null : jenisKepemilikan.toJson(),
    "kondisi_bangunan": kondisiBangunan == null ? null : kondisiBangunan.toJson(),
    "sumber": sumber == null ? null : sumber.toJson(),
  };
}

class JenisBangunan {
  JenisBangunan({
    this.title,
    this.data,
  });

  String title;
  List<Datum> data;

  factory JenisBangunan.fromJson(Map<String, dynamic> json) => JenisBangunan(
    title: json["title"] == null ? null : json["title"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.buildingType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.kepemilikanType,
    this.conditionName,
    this.sumberdanaName,
  });

  int id;
  String buildingType;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String kepemilikanType;
  String conditionName;
  String sumberdanaName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    buildingType: json["building_type"] == null ? null : json["building_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    kepemilikanType: json["kepemilikan_type"] == null ? null : json["kepemilikan_type"],
    conditionName: json["condition_name"] == null ? null : json["condition_name"],
    sumberdanaName: json["sumberdana_name"] == null ? null : json["sumberdana_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "building_type": buildingType == null ? null : buildingType,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
    "kepemilikan_type": kepemilikanType == null ? null : kepemilikanType,
    "condition_name": conditionName == null ? null : conditionName,
    "sumberdana_name": sumberdanaName == null ? null : sumberdanaName,
  };
}
