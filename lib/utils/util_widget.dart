import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

void showToast(BuildContext context,String msg, {int duration, int gravity}) {
  Toast.show(msg, context, duration: Toast.LENGTH_SHORT);
}

void showSnackBar(String title,String meesage) {
  Get.snackbar(
    "$title",
    "$meesage",
    snackPosition: SnackPosition.BOTTOM,
  );
}

void showDialog(String title ,String content) {
  Get.defaultDialog(
    title: "$title",
    content: Text("$content"),
  );
}

class Time {
  static String shubuh = 'Shubuh';
  static String dhuhur = 'Dhuhur';
  static String ashar = 'Ashar';
  static String maghrib = 'Maghrib';
  static String isya = 'Isya';
}

class Format {
  static String time_1 = 'dd MMM yyyy';
  static String time_2 = 'dd MMMM yyyy';
  static String time_3 = 'HH:mm';
  static String time_4 = 'yyyy-MM-dd';
}

class Func {
  static String convertUtf8(String data) {
    var varData = data.codeUnits;
    return utf8.decode(varData);
  }

  static String getTime(var format) {
    var date = DateTime.now();
    var f = DateFormat(format);
    return f.format(date);
  }

  static int timeToInt(String time) {
    List<String> listData = time.split(':');
    return (int.parse(listData[0]) * 60) + int.parse(listData[1]);
  }
}



