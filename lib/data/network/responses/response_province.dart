/**
 *
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

import 'dart:convert';

ResponseProvince responseProvinceFromJson(String str) => ResponseProvince.fromJson(json.decode(str));

String responseProvinceToJson(ResponseProvince data) => json.encode(data.toJson());

class ResponseProvince {
  ResponseProvince({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponseProvince.fromJson(Map<String, dynamic> json) => ResponseProvince(
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
    this.provincesName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String provincesName;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    provincesName: json["provinces_name"] == null ? null : json["provinces_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "provinces_name": provincesName == null ? null : provincesName,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
