import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sarina/data/network/responses/response_covid_provinsi.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/ui/page/menu_covid/detail_covid_provinsi.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';
import 'package:sarina/utils/util_widget.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  List<ListDatum> list_all_prov = [];

  @override
  void initState() {
    getDataCovid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Page'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search),)
        ],
      ),
      body: Container(
        child: list_all_prov.length > 0
            ? ListView.builder(
                itemCount: list_all_prov.length,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 200),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: ListTile(
                          title: Text(list_all_prov[index].key,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),),
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => DetailCovidProvinsi(prov: list_all_prov[index].key,)));
                            },
                          // subtitle: Text(user.phoneNumber),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: blueColors,
                            child: Text(list_all_prov[index].key[0],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold
                                )),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container(),
      ),
    );
  }

  void getDataCovid() {
    ServiceApiConfig().getCovidProv().then((val) {
      setState(() {
        list_all_prov = val.listData;
      });
    }).catchError((onError) {
      print("$onError");
    });
  }

  Future<List<ListDatum>> getProv() async {
    return new Future.delayed(new Duration(seconds: 3), () {
      print(" sadjklas" + list_all_prov.length.toString());
      return list_all_prov;
    });
  }
}
