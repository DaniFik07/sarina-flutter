// To parse this JSON data, do
//
//     final responseGetKuesionerAp = responseGetKuesionerApFromJson(jsonString);

import 'dart:convert';

ResponseGetKuesionerAp responseGetKuesionerApFromJson(String str) => ResponseGetKuesionerAp.fromJson(json.decode(str));

String responseGetKuesionerApToJson(ResponseGetKuesionerAp data) => json.encode(data.toJson());

class ResponseGetKuesionerAp {
  ResponseGetKuesionerAp({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory ResponseGetKuesionerAp.fromJson(Map<String, dynamic> json) => ResponseGetKuesionerAp(
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
    this.ancillaryEquipment,
    this.peralatan,
    this.kondisi,
    this.sumber,
  });

  AncillaryEquipment ancillaryEquipment;
  Kondisi peralatan;
  Kondisi kondisi;
  Kondisi sumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    ancillaryEquipment: json["ancillary_equipment"] == null ? null : AncillaryEquipment.fromJson(json["ancillary_equipment"]),
    peralatan: json["peralatan"] == null ? null : Kondisi.fromJson(json["peralatan"]),
    kondisi: json["kondisi"] == null ? null : Kondisi.fromJson(json["kondisi"]),
    sumber: json["sumber"] == null ? null : Kondisi.fromJson(json["sumber"]),
  );

  Map<String, dynamic> toJson() => {
    "ancillary_equipment": ancillaryEquipment == null ? null : ancillaryEquipment.toJson(),
    "peralatan": peralatan == null ? null : peralatan.toJson(),
    "kondisi": kondisi == null ? null : kondisi.toJson(),
    "sumber": sumber == null ? null : sumber.toJson(),
  };
}

class AncillaryEquipment {
  AncillaryEquipment({
    this.title,
    this.data,
  });

  String title;
  List<AncillaryEquipmentDatum> data;

  factory AncillaryEquipment.fromJson(Map<String, dynamic> json) => AncillaryEquipment(
    title: json["title"] == null ? null : json["title"],
    data: json["data"] == null ? null : List<AncillaryEquipmentDatum>.from(json["data"].map((x) => AncillaryEquipmentDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AncillaryEquipmentDatum {
  AncillaryEquipmentDatum({
    this.id,
    this.provincesId,
    this.regenciesId,
    this.conditionId,
    this.picId,
    this.usersId,
    this.equipmentId,
    this.sumberId,
    this.tahun,
    this.ancillaryEquipmentAmount,
    this.ancillaryEquipmentDescription,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int provincesId;
  int regenciesId;
  int conditionId;
  int picId;
  int usersId;
  int equipmentId;
  dynamic sumberId;
  String tahun;
  int ancillaryEquipmentAmount;
  String ancillaryEquipmentDescription;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  factory AncillaryEquipmentDatum.fromJson(Map<String, dynamic> json) => AncillaryEquipmentDatum(
    id: json["id"] == null ? null : json["id"],
    provincesId: json["provinces_id"] == null ? null : json["provinces_id"],
    regenciesId: json["regencies_id"] == null ? null : json["regencies_id"],
    conditionId: json["condition_id"] == null ? null : json["condition_id"],
    picId: json["pic_id"] == null ? null : json["pic_id"],
    usersId: json["users_id"] == null ? null : json["users_id"],
    equipmentId: json["equipment_id"] == null ? null : json["equipment_id"],
    sumberId: json["sumber_id"],
    tahun: json["tahun"] == null ? null : json["tahun"],
    ancillaryEquipmentAmount: json["ancillary_equipment_amount"] == null ? null : json["ancillary_equipment_amount"],
    ancillaryEquipmentDescription: json["ancillary_equipment_description"] == null ? null : json["ancillary_equipment_description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "provinces_id": provincesId == null ? null : provincesId,
    "regencies_id": regenciesId == null ? null : regenciesId,
    "condition_id": conditionId == null ? null : conditionId,
    "pic_id": picId == null ? null : picId,
    "users_id": usersId == null ? null : usersId,
    "equipment_id": equipmentId == null ? null : equipmentId,
    "sumber_id": sumberId,
    "tahun": tahun == null ? null : tahun,
    "ancillary_equipment_amount": ancillaryEquipmentAmount == null ? null : ancillaryEquipmentAmount,
    "ancillary_equipment_description": ancillaryEquipmentDescription == null ? null : ancillaryEquipmentDescription,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
  };
}

class Kondisi {
  Kondisi({
    this.title,
    this.data,
  });

  String title;
  List<KondisiDatum> data;

  factory Kondisi.fromJson(Map<String, dynamic> json) => Kondisi(
    title: json["title"] == null ? null : json["title"],
    data: json["data"] == null ? null : List<KondisiDatum>.from(json["data"].map((x) => KondisiDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class KondisiDatum {
  KondisiDatum({
    this.id,
    this.conditionName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.equipmentName,
    this.sumberdanaName,
  });

  int id;
  String conditionName;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String equipmentName;
  String sumberdanaName;

  factory KondisiDatum.fromJson(Map<String, dynamic> json) => KondisiDatum(
    id: json["id"] == null ? null : json["id"],
    conditionName: json["condition_name"] == null ? null : json["condition_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    equipmentName: json["equipment_name"] == null ? null : json["equipment_name"],
    sumberdanaName: json["sumberdana_name"] == null ? null : json["sumberdana_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "condition_name": conditionName == null ? null : conditionName,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
    "equipment_name": equipmentName == null ? null : equipmentName,
    "sumberdana_name": sumberdanaName == null ? null : sumberdanaName,
  };
}
