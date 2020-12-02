import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sarina/data/network/responses/response_detail_prov.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class DetailCovidProvinsi extends StatefulWidget {
  final String prov;
  DetailCovidProvinsi({this.prov});
  @override
  _DetailCovidProvinsiState createState() => _DetailCovidProvinsiState();
}


class _DetailCovidProvinsiState extends State<DetailCovidProvinsi> {
  List<ListPerkembangan> list_prov = [];
  String last_date;
  int  kasus_total;
  double sembuh ,meninggal;
@override
  void initState() {
    getDataDetailProv(widget.prov);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.prov}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHight / 4,
            child: Card(
              color: Colors.orange[200],
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('last date : ${last_date}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    SizedBox(height: 4,),
                    Text('kasus total : ${kasus_total}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    SizedBox(height: 4,),
                    Text('meninggal : ${meninggal}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                    SizedBox(height: 4,),
                    Text('sembuh : ${sembuh}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: SizeConfig.screenHight / 1.6,
            child: list_prov.length > 0
                ? ListView.builder(
              itemCount: list_prov.length,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 200),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Card(
                        margin: EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Tanggal : ${list_prov[index].tanggal}',
                                      style: TextStyle(
                                        fontSize: 14,),),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Text('Kasus : ${list_prov[index].kasus.toString()}',
                                      style: TextStyle(
                                          fontSize: 14,),),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Text('Kasus : ${list_prov[index].kasus.toString()}',
                                      style: TextStyle(fontSize: 14,),),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Text('Meninggal : ${list_prov[index].meninggal.toString()}',
                                      style: TextStyle(fontSize: 14,),),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  children: [
                                    Text('Sembuh : ${list_prov[index].sembuh.toString()}',
                                      style: TextStyle(fontSize: 14, ),),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                );
              },
            )
                : Container(),
          ),
        ],
      ),
    );
  }

  void getDataDetailProv(String prov) {
  print(prov.replaceAll(" ", "_") + "data prov");
    ServiceApiConfig().getCovidDetailProv(prov.replaceAll(" ", "_")).then((val) {
      setState(() {
        list_prov = val.listPerkembangan;
        sembuh= val.sembuhPersen;
        meninggal = val.meninggalPersen;
        kasus_total = val.kasusTotal;
        last_date = val.lastDate.toString();
      });
    }).catchError((onError) {
      print("$onError");
    });
  }
}
