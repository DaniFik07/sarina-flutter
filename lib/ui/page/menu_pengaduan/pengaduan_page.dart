import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/models/model_home.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/refresh.dart';
import 'package:sarina/utils/size_config.dart';

import 'input_pengaduan_page.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class PengaduanPage extends StatefulWidget {
  @override
  _PengaduanPageState createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  Color red800 = Colors.red[800];
  List<ModelPengaduan> listItem = [];
  String status_login = "";
  final storage = new FlutterSecureStorage();
  TextEditingController searchController = new TextEditingController();
  String filter;

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
    checkRole();
    addData();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Visibility(
          // visible: status_login ==IS_ADMIN || status_login ==IS_USER?false:true,
          visible: true,
          child: FloatingActionButton.extended(
            elevation: 3,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => InputPengaduanPage()));
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
      ),
      appBar: AppBar(
        title: Text('Daftar Pengaduan'),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: searchController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Cari",
                            hintStyle: TextStyle(fontSize: 16),
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
                child: listItem.length > 0
                    ? ListView.builder(
                        itemCount: listItem.length,
                        itemBuilder: (BuildContext context, int index) {
                          return filter == null || filter == ""
                              ? AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: new Stack(
                                        children: <Widget>[
                                          new Padding(
                                            padding: const EdgeInsets.only(
                                                left: 50.0),
                                            child: new Card(
                                              margin: new EdgeInsets.all(20.0),
                                              child: new Container(
                                                  margin: EdgeInsets.all(8.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Text(
                                                              listItem[index]
                                                                  .judul),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Row(
                                                            children: [
                                                              Text("Status : "),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Card(
                                                                  color: listItem[index]
                                                                              .status ==
                                                                          "1"
                                                                      ? greenColors
                                                                      : redColors,
                                                                  child: Text(
                                                                    "${listItem[index].status == "1" ? "Sudah Ditangani" : "Belum diTangani"} ",
                                                                    style: TextStyle(
                                                                        color:
                                                                            whiteColor),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Text(
                                                              "${listItem[index].Deskripsi}"),
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
                                )
                              : '${listItem[index].judul}'
                                      .toLowerCase()
                                      .contains(filter.toLowerCase())
                                  ? AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      child: SlideAnimation(
                                        verticalOffset: 50.0,
                                        child: FadeInAnimation(
                                          child: new Stack(
                                            children: <Widget>[
                                              new Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 50.0),
                                                child: new Card(
                                                  margin:
                                                      new EdgeInsets.all(20.0),
                                                  child: new Container(
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                  listItem[
                                                                          index]
                                                                      .judul),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                      "Status : "),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Card(
                                                                      color: listItem[index].status ==
                                                                              "1"
                                                                          ? greenColors
                                                                          : redColors,
                                                                      child:
                                                                          Text(
                                                                        "${listItem[index].status == "1" ? "Sudah Ditangani" : "Belum diTangani"} ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                whiteColor),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                  "${listItem[index].Deskripsi}"),
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
                                                    margin:
                                                        new EdgeInsets.all(5.0),
                                                    height: 30.0,
                                                    width: 30.0,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container();
                        },
                      )
                    : Image.asset("assets/img/not.png"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addData() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    status_login = await storage.read(key: STATUS_LOGIN);
    String pic_id = await storage.read(key: ID_PIC);

    if (status_login == IS_ADMIN) {
      ServiceApiConfig().getAllPengaduan(token).then((data) {
        data.data.forEach((element) {
          setState(() {
            listItem.add(new ModelPengaduan(
                judul: element.judul,
                Deskripsi: element.deskripsiKejadian,
                status: element.status == "Sudah Ditangani" ? "1" : "2"));
          });
        });
      });
    } else {
      ServiceApiConfig().getPengaduan(token, pic_id).then((data) {
        data.data.forEach((element) {
          setState(() {
            listItem.add(new ModelPengaduan(
                judul: element.judul,
                Deskripsi: element.deskripsiKejadian,
                status: element.status == "Sudah Ditangani" ? "1" : "2"));
          });
        });
      });
    }
  }

  void checkRole() async {
    status_login = await storage.read(key: STATUS_LOGIN);
    setState(() {});
  }
}
