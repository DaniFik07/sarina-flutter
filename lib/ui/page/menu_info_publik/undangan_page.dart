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

class DafrarUndanganPage extends StatefulWidget {
  @override
  _DafrarUndanganPageState createState() => _DafrarUndanganPageState();
}

class _DafrarUndanganPageState extends State<DafrarUndanganPage> {
  Color red800 = Colors.red[800];
  List<ModelItemUndangan> modelItemUndanganList = [];

  @override
  void initState() {
    addData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          elevation: 3,
          onPressed: () {
          },
          backgroundColor: greenColors,
          label: Container(
            child: Text(
              "+ Baru",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Daftar Undangan', style: TextStyle(),),
      ),
      body: Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.8,
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
              height: SizeConfig.screenHight /1.5,
              child: ListView.builder(
                itemCount: modelItemUndanganList.length,
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
                              child: new Card(
                                margin: new EdgeInsets.all(20.0),
                                child: new Container(
                                    margin: EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                                modelItemUndanganList[index].Deskripsi),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(4.0),
                                            child: Row(
                                              children: [
                                                Text("Tanggal Pelaksanaan : "),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Card(color:greenColors,child: Text("${modelItemUndanganList[index].tglPelaksanan} ",style: TextStyle(color: whiteColor),),),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(4.0),
                                            child: Row(
                                              children: [
                                                Text("Waktu Pelaksanaan : "),
                                                Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Card(color:orangeColor,child: Text("${modelItemUndanganList[index].WaktuPelaksana} ",style: TextStyle(color: whiteColor),),),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
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
                              top: 100.0,
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
    );
  }

  void addData() {
    setState(() {
      modelItemUndanganList.add(new ModelItemUndangan(
          judul: "Lorem Ipsum Lorem Ipsum ",
          Deskripsi: "Lorem Ipsum Lorem Ipsum",
          tglPelaksanan: "01-02-2020",
          WaktuPelaksana: "19:00:00"));

      modelItemUndanganList.add(new ModelItemUndangan(
          judul: "Lorem Ipsum Lorem Ipsum ",
          Deskripsi: "Lorem Ipsum Lorem Ipsum",
          tglPelaksanan: "03-02-2020",
          WaktuPelaksana: "18:00:00"));
    });
  }
}
