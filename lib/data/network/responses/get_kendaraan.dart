/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
//
//     final responseGetKendaraan = responseGetKendaraanFromJson(jsonString);

import 'dart:convert';

ResponseGetKendaraan responseGetKendaraanFromJson(String str) => ResponseGetKendaraan.fromJson(json.decode(str));

String responseGetKendaraanToJson(ResponseGetKendaraan data) => json.encode(data.toJson());

class ResponseGetKendaraan {
  ResponseGetKendaraan({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory ResponseGetKendaraan.fromJson(Map<String, dynamic> json) => ResponseGetKendaraan(
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
    this.jenisKendaraan,
    this.kendaraan,
    this.kondisi,
    this.sumber,
  });

  JenisKendaraan jenisKendaraan;
  Kendaraan kendaraan;
  JenisKendaraan kondisi;
  JenisKendaraan sumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    jenisKendaraan: json["jenis_kendaraan"] == null ? null : JenisKendaraan.fromJson(json["jenis_kendaraan"]),
    kendaraan: json["kendaraan"] == null ? null : Kendaraan.fromJson(json["kendaraan"]),
    kondisi: json["kondisi"] == null ? null : JenisKendaraan.fromJson(json["kondisi"]),
    sumber: json["sumber"] == null ? null : JenisKendaraan.fromJson(json["sumber"]),
  );

  Map<String, dynamic> toJson() => {
    "jenis_kendaraan": jenisKendaraan == null ? null : jenisKendaraan.toJson(),
    "kendaraan": kendaraan == null ? null : kendaraan.toJson(),
    "kondisi": kondisi == null ? null : kondisi.toJson(),
    "sumber": sumber == null ? null : sumber.toJson(),
  };
}

class JenisKendaraan {
  JenisKendaraan({
    this.title,
    this.data,
  });

  String title;
  List<JenisKendaraanDatum> data;

  factory JenisKendaraan.fromJson(Map<String, dynamic> json) => JenisKendaraan(
    title: json["title"] == null ? null : json["title"],
    data: json["data"] == null ? null : List<JenisKendaraanDatum>.from(json["data"].map((x) => JenisKendaraanDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class JenisKendaraanDatum {
  JenisKendaraanDatum({
    this.id,
    this.vehicleType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.conditionName,
    this.sumberdanaName,
  });

  int id;
  String vehicleType;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String conditionName;
  String sumberdanaName;

  factory JenisKendaraanDatum.fromJson(Map<String, dynamic> json) => JenisKendaraanDatum(
    id: json["id"] == null ? null : json["id"],
    vehicleType: json["vehicle_type"] == null ? null : json["vehicle_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    conditionName: json["condition_name"] == null ? null : json["condition_name"],
    sumberdanaName: json["sumberdana_name"] == null ? null : json["sumberdana_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "vehicle_type": vehicleType == null ? null : vehicleType,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
    "condition_name": conditionName == null ? null : conditionName,
    "sumberdana_name": sumberdanaName == null ? null : sumberdanaName,
  };
}

class Kendaraan {
  Kendaraan({
    this.title,
    this.data,
  });

  String title;
  List<KendaraanDatum> data;

  factory Kendaraan.fromJson(Map<String, dynamic> json) => Kendaraan(
    title: json["title"] == null ? null : json["title"],
    data: json["data"] == null ? null : List<KendaraanDatum>.from(json["data"].map((x) => KendaraanDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class KendaraanDatum {
  KendaraanDatum({
    this.id,
    this.vehicleTypeId,
    this.vehicleName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int vehicleTypeId;
  String vehicleName;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory KendaraanDatum.fromJson(Map<String, dynamic> json) => KendaraanDatum(
    id: json["id"] == null ? null : json["id"],
    vehicleTypeId: json["vehicle_type_id"] == null ? null : json["vehicle_type_id"],
    vehicleName: json["vehicle_name"] == null ? null : json["vehicle_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "vehicle_type_id": vehicleTypeId == null ? null : vehicleTypeId,
    "vehicle_name": vehicleName == null ? null : vehicleName,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
