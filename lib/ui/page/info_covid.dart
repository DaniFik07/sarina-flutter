import 'package:flutter/material.dart';
import 'package:sarina/ui/page/covid_page/datasource.dart';
import 'package:sarina/ui/page/covid_page/pannels/worldwidepannels.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

class InfoCovidPage extends StatefulWidget {
  @override
  _InfoCovidPageState  createState() => _InfoCovidPageState();
}

class _InfoCovidPageState extends State<InfoCovidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("COVID-19 TRACKER"),
      ),
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            height: 100,
            color: Colors.orange[100],
            child: Text(DataSource.quote, style: TextStyle(
              color: Colors.orange[800],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
            child: Text('Worldwide',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),),
          ),
          WorldWidePanel()
        ],
      ),),
    );
  }
}