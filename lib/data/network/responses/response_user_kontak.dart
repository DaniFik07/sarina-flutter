

import 'dart:convert';

ResponseUserKontak responseUserKontakFromJson(String str) => ResponseUserKontak.fromJson(json.decode(str));

String responseUserKontakToJson(ResponseUserKontak data) => json.encode(data.toJson());

class ResponseUserKontak {
  ResponseUserKontak({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponseUserKontak.fromJson(Map<String, dynamic> json) => ResponseUserKontak(
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
    this.namaProvinsi,
    this.namaKabupaten,
    this.id,
    this.provincesId,
    this.regenciesId,
    this.levelId,
    this.picId,
    this.fullname,
    this.username,
    this.email,
    this.password,
    this.noTelpon,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
  });

  String namaProvinsi;
  String namaKabupaten;
  int id;
  int provincesId;
  int regenciesId;
  int levelId;
  int picId;
  String fullname;
  String username;
  String email;
  String password;
  int noTelpon;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic token;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    namaProvinsi: json["nama_provinsi"] == null ? null : json["nama_provinsi"],
    namaKabupaten: json["nama_kabupaten"] == null ? null : json["nama_kabupaten"],
    id: json["id"] == null ? null : json["id"],
    provincesId: json["provinces_id"] == null ? null : json["provinces_id"],
    regenciesId: json["regencies_id"] == null ? null : json["regencies_id"],
    levelId: json["level_id"] == null ? null : json["level_id"],
    picId: json["pic_id"] == null ? null : json["pic_id"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    noTelpon: json["no_telpon"] == null ? null : json["no_telpon"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "nama_provinsi": namaProvinsi == null ? null : namaProvinsi,
    "nama_kabupaten": namaKabupaten == null ? null : namaKabupaten,
    "id": id == null ? null : id,
    "provinces_id": provincesId == null ? null : provincesId,
    "regencies_id": regenciesId == null ? null : regenciesId,
    "level_id": levelId == null ? null : levelId,
    "pic_id": picId == null ? null : picId,
    "fullname": fullname == null ? null : fullname,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "no_telpon": noTelpon == null ? null : noTelpon,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "token": token,
  };
}
