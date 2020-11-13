import 'package:flutter/material.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

Widget menuCircle(Function onpress ,IconData icon, double screenWidth, double screenHight,String text){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: screenWidth / 4,
        height: screenHight/6,
        child: Icon(icon, size: 20,),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: yellowColor),
      ),
      Text(text)
    ],
  );
}