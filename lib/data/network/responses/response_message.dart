// To parse this JSON data, do
//
//     final responseMessage = responseMessageFromJson(jsonString);

import 'dart:convert';

ResponseMessage responseMessageFromJson(String str) => ResponseMessage.fromJson(json.decode(str));

String responseMessageToJson(ResponseMessage data) => json.encode(data.toJson());

class ResponseMessage {
  ResponseMessage({
    this.status,
    this.msg,
  });

  String status;
  String msg;

  factory ResponseMessage.fromJson(Map<String, dynamic> json) => ResponseMessage(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
  };
}
