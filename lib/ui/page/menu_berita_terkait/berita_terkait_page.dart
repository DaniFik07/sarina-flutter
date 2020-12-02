import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sarina/models/model_home.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class BeritaTerkait extends StatefulWidget {
  @override
  _BeritaTerkaitState createState() => _BeritaTerkaitState();
}

class _BeritaTerkaitState extends State<BeritaTerkait> {
  Color red800 = Colors.red[800];
  List<ModelBeritaTerkait> listBerita = [];

  @override
  void initState() {
    addData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Terkait',
          style: TextStyle(),),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHight / 5,
                color: blueColors,
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHight / 18),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Cari",
                            hintStyle: TextStyle(
                                fontSize: 16),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search_outlined),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: SizeConfig.screenHight / 1.5,
                child: ListView.builder(
                  itemCount: listBerita.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: new Stack(
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: new Card(
                                    margin: new EdgeInsets.all(20.0),
                                    child: new Container(
                                        margin: EdgeInsets.all(8.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Flexible(child: Image.asset(
                                                listBerita[index].img, width: 50,
                                                height: 50,)),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(4.0),
                                                      child: Text(
                                                        listBerita[index].judul,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black),),
                                                    ),
                                                    Padding(
                                                        padding:
                                                        const EdgeInsets.all(4.0),
                                                        child: Text(
                                                          listBerita[index].Deskripsi,
                                                          style: TextStyle(
                                                              color: abuAbu),),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                              new Positioned(
                                top: 0.0,
                                bottom: 0.0,
                                left: 35.0,
                                child: new Container(
                                  height: double.infinity,
                                  width: 1.0,
                                  color: blueColors,
                                ),
                              ),
                              new Positioned(
                                top: 90.0,
                                left: 27.0,
                                child: new Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: new Container(
                                    margin: new EdgeInsets.all(5.0),
                                    height: 30.0,
                                    width: 30.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  void addData() {
    setState(() {
      listBerita.add(new ModelBeritaTerkait(
          judul: "judul ",
          Deskripsi: "Lorem Ipsum Lorem Ipsum",
          img: "assets/img/logokm.png"));

      listBerita.add(new ModelBeritaTerkait(
          judul: "judul2",
          Deskripsi: "Lorem Ipsum Lorem Ipsum2 Lorem Ipsum Lorem Ipsum2",
          img: "assets/img/logokm.png"));
    });
  }
}
