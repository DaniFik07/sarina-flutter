import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sarina/data/network/responses/response_covid_provinsi.dart';
import 'package:sarina/data/network/servis_api_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  List<ListDatum> list_all_prov;


  @override
  void initState() {
    getDataCovid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Covid Page'),),
    body: Container(
      child: Column(
        children: [
          ListView.builder(
            itemCount: list_all_prov.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text(
                          "sadas"),
                      onTap: () {
                      },
                      subtitle: Text(
                          "dss"),
                      leading: Text(
                          list_all_prov[index].key[0],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    ),
    );
  }

  void getDataCovid() async{
    ServiceApiConfig().getCovidProv().then((val){
      setState(() {
        list_all_prov = val.listData;
      });
    }).catchError((onError){

    });
  }
}
