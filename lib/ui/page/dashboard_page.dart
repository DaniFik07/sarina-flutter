import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sarina/models/model_home.dart';
import 'package:sarina/ui/page/berita_terkait_page.dart';
import 'package:sarina/ui/page/info_covid.dart';
import 'package:sarina/ui/page/info_public.dart';
import 'package:sarina/ui/page/pengaduan_page.dart';
import 'package:sarina/ui/page/profile_daerah.dart';
import 'package:sarina/ui/page/program_dan_kegiatan.dart';
import 'package:sarina/ui/widget/menu_circle.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> imgList = [];
  String status_login = "";
  final storage = new FlutterSecureStorage();

  int _current = 0;
  List<DashboardItems> itemDashboard = [];

  @override
  void initState() {
    initMenu();
    //cek role sebelm widget dibangun / pertama kali page ini di jalankan
    chekRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHight,
        color: blueColors,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHight / 11,
              ),


              //ternary operator
              // : itu adalah else atau lainnya
              // setelah (tanda tnya) atau ?  untk eksekusi jika masuk kedalam kondisi
              Text(status_login == IS_ADMIN ?"ADMIN":status_login == IS_STAFF?"STAFF" :"USER"),

              // Visibility(
              //   visible: status_login == "1"?true:false,
              //     child: Text(
              //         status_login == "1"?"admn":"bkn admn"
              // )),

              Container(
                  child: Text(
                'SARINA',
                style: TextStyle(
                    fontSize: SizeConfig.blockVertical * 4,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
              ),
              buildCarousel(),
              buildMenu(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarousel() {
    return imgList.length < 1
        ? Container()
        : CarouselSlider(
            items: imgList
                .map((item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Center(
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Image.asset(item,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width)),
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          );
  }

  Widget buildMenu(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemDashboard.length,
        itemBuilder: (context, index) {
          return itemDashboard.length < 1
              ? Container
              : Center(
                  child: Container(
                      height: SizeConfig.screenHight / 6,
                      width: SizeConfig.screenWidth / 2,
                      margin: EdgeInsets.only(
                          left: 2.0, right: 2.0, top: 2.0, bottom: 2.0),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: ()
                      {
                      if (itemDashboard[index].title ==
                      "Profile Daerah") {
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileDaerahPage()));
                      }else if(itemDashboard[index].title == "Program & \n Kegiatan"){
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProgramDanKegiatan()));
                      }else if(itemDashboard[index].title == "Info Publik"){
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InfoPublicPage()));
                      }else if(itemDashboard[index].title == "Berita Terkait"){
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BeritaTerkait()));
                      }else if(itemDashboard[index].title == "Pengaduan"){
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PengaduanPage()));
                      }else if(itemDashboard[index].title == "Info Covid-19"){
                      Navigator.of(context).push(MaterialPageRoute
                      (builder: (context) => InfoCovidPage()));
                      }
                      },
                            child: Card(
                                color: kuningColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80))),
                                elevation: 4,
                                child: Center(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        itemDashboard[index].img,
                                        width: 42,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ))),
                          ),
                          Text(itemDashboard[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.blockVertical* 1.5,
                                  color: Colors.white)),
                        ],
                      )));
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
      ),
    );
  }

  void initMenu() async {
    setState(() {
      imgList.add("assets/img/flutter.png");
      imgList.add("assets/img/flutter.png");
      itemDashboard.add(new DashboardItems(
          title: "Profile Daerah",
          subtitle: "dsadas",
          img: "assets/icons/copy.png"));
      itemDashboard.add(new DashboardItems(
          title: "Program & \n Kegiatan",
          subtitle: "dsadas",
          img: "assets/icons/schedules.png"));
      itemDashboard.add(new DashboardItems(
          title: "Info Publik",
          subtitle: "dsadas",
          img: "assets/icons/information-point.png"));
      itemDashboard.add(new DashboardItems(
          title: "Berita Terkait",
          subtitle: "dsadas",
          img: "assets/icons/news.png"));
      itemDashboard.add(new DashboardItems(
          title: "Pengaduan",
          subtitle: "dsadas",
          img: "assets/icons/feedback.png"));
      itemDashboard.add(new DashboardItems(
          title: "Info Covid-19",
          subtitle: "dsadas",
          img: "assets/icons/coronavirus.png"));
    });
  }

  void chekRole() async{
    //baca vale dari kunci STATuS_LOGIN
    status_login = await storage.read(key: STATUS_LOGIN);
    setState(() {});
  }
}
