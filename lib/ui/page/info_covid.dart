import 'package:flutter/material.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

class InfoCovidPage extends StatefulWidget {
  @override
  _InfoCovidPageState  createState() => _InfoCovidPageState();
}

class _InfoCovidPageState extends State<InfoCovidPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Info Covid-19"),
      ),
      body: Container(
        height: SizeConfig.screenHight,
        color: blueColors,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
              height: 10,
            )],
          ),
        ),
      ),
    );
  }
}