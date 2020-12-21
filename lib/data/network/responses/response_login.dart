/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    this.status,
    this.msg,
    this.token,
    this.userData,
  });

  String status;
  String msg;
  String token;
  UserData userData;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
    token: json["token"] == null ? null : json["token"],
    userData: json["user_data"] == null ? null : UserData.fromJson(json["user_data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
    "token": token == null ? null : token,
    "user_data": userData == null ? null : userData.toJson(),
  };
}

class UserData {
  UserData({
    this.idUser,
    this.username,
    this.idRole,
    this.noTelpon,
    this.email,
  });

  int idUser;
  String username;
  int idRole;
  String noTelpon;
  String email;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    idUser: json["id_user"] == null ? null : json["id_user"],
    username: json["username"] == null ? null : json["username"],
    idRole: json["id_role"] == null ? null : json["id_role"],
    noTelpon: json["no_telpon"] == null ? null : json["no_telpon"],
    email: json["email"] == null ? null : json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser == null ? null : idUser,
    "username": username == null ? null : username,
    "id_role": idRole == null ? null : idRole,
    "no_telpon": noTelpon == null ? null : noTelpon,
    "email": email == null ? null : email,
  };
}
