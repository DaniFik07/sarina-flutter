// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

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
    this.fullname,
    this.username,
    this.levelId,
    this.noTelpon,
    this.email,
    this.picId,
  });

  int idUser;
  String fullname;
  String username;
  int levelId;
  int noTelpon;
  String email;
  int picId;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    idUser: json["id_user"] == null ? null : json["id_user"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    username: json["username"] == null ? null : json["username"],
    levelId: json["level_id"] == null ? null : json["level_id"],
    noTelpon: json["no_telpon"] == null ? null : json["no_telpon"],
    email: json["email"] == null ? null : json["email"],
    picId: json["pic_id"] == null ? null : json["pic_id"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser == null ? null : idUser,
    "fullname": fullname == null ? null : fullname,
    "username": username == null ? null : username,
    "level_id": levelId == null ? null : levelId,
    "no_telpon": noTelpon == null ? null : noTelpon,
    "email": email == null ? null : email,
    "pic_id": picId == null ? null : picId,
  };
}
