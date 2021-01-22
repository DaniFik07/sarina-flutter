/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
//
//     final responseGetSlider = responseGetSliderFromJson(jsonString);

import 'dart:convert';

ResponseGetSlider responseGetSliderFromJson(String str) => ResponseGetSlider.fromJson(json.decode(str));

String responseGetSliderToJson(ResponseGetSlider data) => json.encode(data.toJson());

class ResponseGetSlider {
  ResponseGetSlider({
    this.status,
    this.data,
  });

  String status;
  List<Datum> data;

  factory ResponseGetSlider.fromJson(Map<String, dynamic> json) => ResponseGetSlider(
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
    this.link,
  });

  int id;
  String link;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    link: json["link"] == null ? null : json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "link": link == null ? null : link,
  };
}
