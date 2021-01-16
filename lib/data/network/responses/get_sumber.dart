/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

// To parse this JSON data, do
//
//     final responseGetSumber = responseGetSumberFromJson(jsonString);

import 'dart:convert';

ResponseGetSumber responseGetSumberFromJson(String str) => ResponseGetSumber.fromJson(json.decode(str));

String responseGetSumberToJson(ResponseGetSumber data) => json.encode(data.toJson());

class ResponseGetSumber {
  ResponseGetSumber({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponseGetSumber.fromJson(Map<String, dynamic> json) => ResponseGetSumber(
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
    this.sumberdanaName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String sumberdanaName;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    sumberdanaName: json["sumberdana_name"] == null ? null : json["sumberdana_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "sumberdana_name": sumberdanaName == null ? null : sumberdanaName,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
