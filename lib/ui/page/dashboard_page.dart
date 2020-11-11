import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sarina/models/model_home.dart';
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
  int _current = 0;
  List<DashboardItems> itemDashboard = [];

  @override
  void initState() {
    initMenu();
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
              Container(
                  child: Text(
                'Sarina',
                style: TextStyle(
                    fontSize: SizeConfig.blockVertical * 4, color: whiteColor),
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
    return imgList.length <1? Container():CarouselSlider(
      items: imgList
          .map((item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.asset(item,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width)),
          ),
        ),
      ))
          .toList(),
      options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
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
          return itemDashboard.length<1 ?Container: Center(
              child: Container(
                  height: SizeConfig.screenHight / 6,
                  width: SizeConfig.screenWidth / 2,
                  child: InkWell(
                    onTap: () {
                      if (itemDashboard[index].title ==  "Profile Daerah") {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => DashboardPage()));
                      }                    },
                    child: Card(
                        color: orangeColor,
                        elevation: 4,
                        child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  itemDashboard[index].img,
                                  width: 42,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(itemDashboard[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "WorkSansSemiBold")),
                              ],
                            ))),
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
          img: "assets/img/document.png"));
      itemDashboard.add(new DashboardItems(
          title: "ttestestes",
          subtitle: "dsadas",
          img: "assets/img/document.png"));
      itemDashboard.add(new DashboardItems(
          title: "ttestestes",
          subtitle: "dsadas",
          img: "assets/img/document.png"));
      itemDashboard.add(new DashboardItems(
          title: "ttestestes",
          subtitle: "dsadas",
          img: "assets/img/document.png"));
      itemDashboard.add(new DashboardItems(
          title: "ttestestes",
          subtitle: "dsadas",
          img: "assets/img/document.png"));
    });
  }
}
