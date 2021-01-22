/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
//
//     final responseDataKegiatan = responseDataKegiatanFromJson(jsonString);

import 'dart:convert';

ResponseDataKegiatan responseDataKegiatanFromJson(String str) => ResponseDataKegiatan.fromJson(json.decode(str));

String responseDataKegiatanToJson(ResponseDataKegiatan data) => json.encode(data.toJson());

class ResponseDataKegiatan {
  ResponseDataKegiatan({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponseDataKegiatan.fromJson(Map<String, dynamic> json) => ResponseDataKegiatan(
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
    this.sumberId,
    this.galleryId,
    this.picId,
    this.eventType,
    this.eventName,
    this.eventProgress,
    this.eventDate,
    this.eventTime,
    this.eventDescription,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int usersId;
  int sumberId;
  int galleryId;
  int picId;
  String eventType;
  String eventName;
  int eventProgress;
  DateTime eventDate;
  String eventTime;
  String eventDescription;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    usersId: json["users_id"] == null ? null : json["users_id"],
    sumberId: json["sumber_id"] == null ? null : json["sumber_id"],
    galleryId: json["gallery_id"] == null ? null : json["gallery_id"],
    picId: json["pic_id"] == null ? null : json["pic_id"],
    eventType: json["event_type"] == null ? null : json["event_type"],
    eventName: json["event_name"] == null ? null : json["event_name"],
    eventProgress: json["event_progress"] == null ? null : json["event_progress"],
    eventDate: json["event_date"] == null ? null : DateTime.parse(json["event_date"]),
    eventTime: json["event_time"] == null ? null : json["event_time"],
    eventDescription: json["event_description"] == null ? null : json["event_description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "users_id": usersId == null ? null : usersId,
    "sumber_id": sumberId == null ? null : sumberId,
    "gallery_id": galleryId == null ? null : galleryId,
    "pic_id": picId == null ? null : picId,
    "event_type": eventType == null ? null : eventType,
    "event_name": eventName == null ? null : eventName,
    "event_progress": eventProgress == null ? null : eventProgress,
    "event_date": eventDate == null ? null : eventDate.toIso8601String(),
    "event_time": eventTime == null ? null : eventTime,
    "event_description": eventDescription == null ? null : eventDescription,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "deleted_at": deletedAt == null ? null : deletedAt.toIso8601String(),
  };
}
