// To parse this JSON data, do
//
//     final responseChatRoom = responseChatRoomFromJson(jsonString);

import 'dart:convert';

ResponseChatRoom responseChatRoomFromJson(String str) => ResponseChatRoom.fromJson(json.decode(str));

String responseChatRoomToJson(ResponseChatRoom data) => json.encode(data.toJson());

class ResponseChatRoom {
  ResponseChatRoom({
    this.status,
    this.data,
  });

  String status;
  Data data;

  factory ResponseChatRoom.fromJson(Map<String, dynamic> json) => ResponseChatRoom(
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
    this.chats,
  });

  List<Chat> chats;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    chats: json["chats"] == null ? null : List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "chats": chats == null ? null : List<dynamic>.from(chats.map((x) => x.toJson())),
  };
}

class Chat {
  Chat({
    this.idPengirim,
    this.idPenerima,
    this.chat,
    this.createdAt,
    this.id,
  });

  int idPengirim;
  int idPenerima;
  String chat;
  DateTime createdAt;
  int id;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    idPengirim: json["idPengirim"] == null ? null : json["idPengirim"],
    idPenerima: json["idPenerima"] == null ? null : json["idPenerima"],
    chat: json["Chat"] == null ? null : json["Chat"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "idPengirim": idPengirim == null ? null : idPengirim,
    "idPenerima": idPenerima == null ? null : idPenerima,
    "Chat": chat == null ? null : chat,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "id": id == null ? null : id,
  };
}
