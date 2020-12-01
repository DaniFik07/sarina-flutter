import 'package:flutter/material.dart';
import 'package:get/get.dart';
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



