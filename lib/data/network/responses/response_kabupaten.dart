/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
//
//     final responseKabupaten = responseKabupatenFromJson(jsonString);

import 'dart:convert';

ResponseKabupaten responseKabupatenFromJson(String str) => ResponseKabupaten.fromJson(json.decode(str));

String responseKabupatenToJson(ResponseKabupaten data) => json.encode(data.toJson());

class ResponseKabupaten {
  ResponseKabupaten({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponseKabupaten.fromJson(Map<String, dynamic> json) => ResponseKabupaten(
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
    this.regenciesName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int provincesId;
  String regenciesName;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    provincesId: json["provinces_id"] == null ? null : json["provinces_id"],
    regenciesName: json["regencies_name"] == null ? null : json["regencies_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "provinces_id": provincesId == null ? null : provincesId,
    "regencies_name": regenciesName == null ? null : regenciesName,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
