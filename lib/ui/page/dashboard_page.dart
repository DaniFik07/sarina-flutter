import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/models/model_home.dart';
import 'package:sarina/ui/page/info_covid.dart';
import 'package:sarina/ui/page/menu_program_dan_kegiatan/form_input_kegiatan.dart';
import 'package:sarina/ui/widget/menu_circle.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

import 'menu_covid/covid_page.dart';
import 'menu_berita_terkait/berita_terkait_page.dart';
import 'menu_info_publik/info_public.dart';
import 'menu_info_publik/undangan_page.dart';
import 'menu_pengaduan/pengaduan_page.dart';
import 'menu_profile_daerah/profile_daerah.dart';
import 'menu_program_dan_kegiatan/program_dan_kegiatan.dart';

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
  String kab_id = "";
  final storage = new FlutterSecureStorage();

  int _current = 0;
  List<DashboardItems> itemDashboard = [];

  @override
  void initState() {
    chekRole();
    initMenu();
    getSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHight,
        // color: blueColors,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHight / 11,
              ),
              Container(
                  child: Card(
                color: blueColors,
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  width: SizeConfig.screenWidth / 1.2,
                  child: Text(
                    'SARINA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: SizeConfig.blockVertical * 4,
                        color: whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
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
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              child: Image.network(item,
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  if (itemDashboard[index].title ==
                                      "Profile Daerah") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileDaerahPage()));
                                  } else if (itemDashboard[index].title ==
                                      "Program & \n Kegiatan") {
                                    if (status_login == IS_ADMIN) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FormInputKegiatan(
                                                      title: "Pusat")));
                                    } else if (status_login == IS_STAFF) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FormInputKegiatan(
                                                      title: "Daerah")));
                                    }
                                  } else if (itemDashboard[index].title ==
                                      "Info Publik") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DaftarUndanganPage()));
                                  } else if (itemDashboard[index].title ==
                                      "Berita Terkait") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BeritaTerkait()));
                                  } else if (itemDashboard[index].title ==
                                      "Pengaduan") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PengaduanPage()));
                                  } else if (itemDashboard[index].title ==
                                      "Info Covid-19") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => CovidPage()));
                                  }
                                },
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 72,
                                                width: 72,
                                                child: Image.asset(
                                                    itemDashboard[index].img),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            Text(itemDashboard[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.blockHorizontal * 3,
                                    color: textColor)),
                          ],
                        ),
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
    status_login = await storage.read(key: STATUS_LOGIN);
    if (status_login == IS_ADMIN) {
      setState(() {
        itemDashboard.add(new DashboardItems(
            title: "Profile Daerah",
            subtitle: "dsadas",
            img: "assets/icons/pd.png"));
        itemDashboard.add(new DashboardItems(
            title: "Program & \n Kegiatan",
            subtitle: "dsadas",
            img: "assets/icons/peng.png"));
        itemDashboard.add(new DashboardItems(
            title: "Info Publik",
            subtitle: "dsadas",
            img: "assets/icons/ip.png"));
        itemDashboard.add(new DashboardItems(
            title: "Berita Terkait",
            subtitle: "dsadas",
            img: "assets/icons/bt.png"));
        itemDashboard.add(new DashboardItems(
            title: "Pengaduan",
            subtitle: "dsadas",
            img: "assets/icons/prog.png"));
        itemDashboard.add(new DashboardItems(
            title: "Info Covid-19",
            subtitle: "dsadas",
            img: "assets/icons/cov.png"));
      });
    } else if (status_login == IS_STAFF) {
      setState(() {
        itemDashboard.add(new DashboardItems(
            title: "Profile Daerah",
            subtitle: "dsadas",
            img: "assets/icons/pd.png"));
        itemDashboard.add(new DashboardItems(
            title: "Program & \n Kegiatan",
            subtitle: "dsadas",
            img: "assets/icons/peng.png"));
        itemDashboard.add(new DashboardItems(
            title: "Info Publik",
            subtitle: "dsadas",
            img: "assets/icons/ip.png"));
        itemDashboard.add(new DashboardItems(
            title: "Berita Terkait",
            subtitle: "dsadas",
            img: "assets/icons/bt.png"));
        itemDashboard.add(new DashboardItems(
            title: "Pengaduan",
            subtitle: "dsadas",
            img: "assets/icons/prog.png"));
        itemDashboard.add(new DashboardItems(
            title: "Info Covid-19",
            subtitle: "dsadas",
            img: "assets/icons/cov.png"));
      });
    } else {
      setState(() {
        itemDashboard.add(new DashboardItems(
            title: "Info Publik",
            subtitle: "dsadas",
            img: "assets/icons/ip.png"));
        itemDashboard.add(new DashboardItems(
            title: "Berita Terkait",
            subtitle: "dsadas",
            img: "assets/icons/bt.png"));
        itemDashboard.add(new DashboardItems(
            title: "Pengaduan",
            subtitle: "dsadas",
            img: "assets/icons/prog.png"));
        itemDashboard.add(new DashboardItems(
            title: "Info Covid-19",
            subtitle: "dsadas",
            img: "assets/icons/cov.png"));
      });
    }
  }

  void chekRole() async {
    status_login = await storage.read(key: STATUS_LOGIN);
    setState(() {});
  }

  void getSlider() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    ServiceApiConfig().getSlider(token).then((val) {
      if (val.data.length > 0) {
        for (int i = 0; i < val.data.length; i++) {
          setState(() {
            imgList.add(val.data[i].link);
          });
        }
      }
    }).catchError((onError) {});
  }
}
