/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
//
//     final responsePicbyId = responsePicbyIdFromJson(jsonString);

import 'dart:convert';

ResponsePicbyId responsePicbyIdFromJson(String str) => ResponsePicbyId.fromJson(json.decode(str));

String responsePicbyIdToJson(ResponsePicbyId data) => json.encode(data.toJson());

class ResponsePicbyId {
  ResponsePicbyId({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponsePicbyId.fromJson(Map<String, dynamic> json) => ResponsePicbyId(
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
    this.picId,
    this.namaProvinsi,
    this.namaKabupaten,
    this.provincesId,
    this.regenciesId,
    this.fullname,
    this.email,
    this.alamat,
    this.noTelpon,
  });

  int picId;
  String namaProvinsi;
  String namaKabupaten;
  int provincesId;
  int regenciesId;
  String fullname;
  String email;
  String alamat;
  String noTelpon;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    picId: json["pic_id"] == null ? null : json["pic_id"],
    namaProvinsi: json["nama_provinsi"] == null ? null : json["nama_provinsi"],
    namaKabupaten: json["nama_kabupaten"] == null ? null : json["nama_kabupaten"],
    provincesId: json["provinces_id"] == null ? null : json["provinces_id"],
    regenciesId: json["regencies_id"] == null ? null : json["regencies_id"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    email: json["email"] == null ? null : json["email"],
    alamat: json["alamat"] == null ? null : json["alamat"],
    noTelpon: json["no_telpon"] == null ? null : json["no_telpon"],
  );

  Map<String, dynamic> toJson() => {
    "pic_id": picId == null ? null : picId,
    "nama_provinsi": namaProvinsi == null ? null : namaProvinsi,
    "nama_kabupaten": namaKabupaten == null ? null : namaKabupaten,
    "provinces_id": provincesId == null ? null : provincesId,
    "regencies_id": regenciesId == null ? null : regenciesId,
    "fullname": fullname == null ? null : fullname,
    "email": email == null ? null : email,
    "alamat": alamat == null ? null : alamat,
    "no_telpon": noTelpon == null ? null : noTelpon,
  };
}
