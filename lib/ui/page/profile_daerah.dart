import 'package:flutter/material.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ProfileDaerahPage extends StatefulWidget {
  @override
  _ProfileDaerahPageState createState() => _ProfileDaerahPageState();
}

class _ProfileDaerahPageState extends State<ProfileDaerahPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text("Profile Daerah"),),
      body: Container(
        height: SizeConfig.screenHight,
        color: blueColors,
        child:Column(
          children: [
            Row(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}
