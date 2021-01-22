/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
//
//     final responseGetSubmitBpbd = responseGetSubmitBpbdFromJson(jsonString);

import 'dart:convert';

ResponseGetSubmitBpbd responseGetSubmitBpbdFromJson(String str) => ResponseGetSubmitBpbd.fromJson(json.decode(str));

String responseGetSubmitBpbdToJson(ResponseGetSubmitBpbd data) => json.encode(data.toJson());

class ResponseGetSubmitBpbd {
  ResponseGetSubmitBpbd({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponseGetSubmitBpbd.fromJson(Map<String, dynamic> json) => ResponseGetSubmitBpbd(
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
    this.picId,
    this.usersId,
    this.regionalDeviceName,
    this.type,
    this.pns,
    this.nonPns,
    this.volunteer,
    this.lainnya,
    this.description,
    this.tahun,
    this.basicFormation,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int provincesId;
  int regenciesId;
  int picId;
  int usersId;
  String regionalDeviceName;
  String type;
  int pns;
  int nonPns;
  int volunteer;
  int lainnya;
  String description;
  String tahun;
  String basicFormation;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    provincesId: json["provinces_id"] == null ? null : json["provinces_id"],
    regenciesId: json["regencies_id"] == null ? null : json["regencies_id"],
    picId: json["pic_id"] == null ? null : json["pic_id"],
    usersId: json["users_id"] == null ? null : json["users_id"],
    regionalDeviceName: json["regional_device_name"] == null ? null : json["regional_device_name"],
    type: json["type"] == null ? null : json["type"],
    pns: json["pns"] == null ? null : json["pns"],
    nonPns: json["non_pns"] == null ? null : json["non_pns"],
    volunteer: json["volunteer"] == null ? null : json["volunteer"],
    lainnya: json["lainnya"] == null ? null : json["lainnya"],
    description: json["description"] == null ? null : json["description"],
    tahun: json["tahun"] == null ? null : json["tahun"],
    basicFormation: json["basic_formation"] == null ? null : json["basic_formation"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "provinces_id": provincesId == null ? null : provincesId,
    "regencies_id": regenciesId == null ? null : regenciesId,
    "pic_id": picId == null ? null : picId,
    "users_id": usersId == null ? null : usersId,
    "regional_device_name": regionalDeviceName == null ? null : regionalDeviceName,
    "type": type == null ? null : type,
    "pns": pns == null ? null : pns,
    "non_pns": nonPns == null ? null : nonPns,
    "volunteer": volunteer == null ? null : volunteer,
    "lainnya": lainnya == null ? null : lainnya,
    "description": description == null ? null : description,
    "tahun": tahun == null ? null : tahun,
    "basic_formation": basicFormation == null ? null : basicFormation,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
