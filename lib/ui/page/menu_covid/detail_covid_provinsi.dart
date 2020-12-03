import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sarina/data/network/responses/response_detail_prov.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/utils/size_config.dart';

import 'package:intl/intl.dart';

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

  // DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  // String string = dateFormat.format(DateTime.now());

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
        children: <Widget>[
          Container(
            child: GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2),
              children: <Widget>[
                StatusPanel(
                  title: 'Tanggal: \n ${last_date}',
                  panelColor: Colors.red[100],
                  textColor: Colors.red,
                ),
                StatusPanel(
                  title: 'Kasus Total: \n ${kasus_total}',
                  panelColor: Colors.blue[100],
                  textColor: Colors.blue[900],
                ),
                StatusPanel(
                  title: 'Sembuh: : \n ${sembuh}',
                  panelColor: Colors.green[100],
                  textColor: Colors.green,
                ),
                StatusPanel(
                  title: 'Meninggal: \n ${meninggal}',
                  panelColor: Colors.grey[400],
                  textColor: Colors.grey[900],
                ),
              ],
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

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
        ],
      ),
    );
  }

}
