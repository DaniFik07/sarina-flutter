/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

import 'dart:convert';

ResponseRegister responseRegisterFromJson(String str) => ResponseRegister.fromJson(json.decode(str));

String responseRegisterToJson(ResponseRegister data) => json.encode(data.toJson());

class ResponseRegister {
  ResponseRegister({
    this.status,
    this.msg,
  });

  String status;
  String msg;

  factory ResponseRegister.fromJson(Map<String, dynamic> json) => ResponseRegister(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
  };
}
