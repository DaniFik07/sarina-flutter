import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sarina/data/network/responses/response_user_kontak.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/models/model_home.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

import 'detail.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ChatBayuPage extends StatefulWidget {
  @override
  _ChatBayuPageState createState() => _ChatBayuPageState();
}

class _ChatBayuPageState extends State<ChatBayuPage> {
  Color red800 = Colors.red[800];
  final storage = new FlutterSecureStorage();
  List<Datum> listChat = [];
  TextEditingController searchController = new TextEditingController();
  String filter;
  String status_login ="";

  @override
  void initState() {
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
      appBar: AppBar(
        title: Text(
          'Chat',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: listChat.length > 0 ?
          Column(
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
                          cursorColor: Colors.black,
                          controller: searchController,
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
                child: ListView.builder(
                  itemCount: listChat.length,
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
                                      padding:
                                          const EdgeInsets.only(left: 50.0),
                                      child: Container(
                                        width: SizeConfig.screenWidth,
                                        child: Hero(
                                          tag: "assets/img/user2.png" + index.toString(),
                                          child: new Material(
                                            child: InkWell(
                                              onTap: (){ Navigator.push(
                                                  context, MaterialPageRoute(builder: (context) => ChatRoom(
                                                  penerima:listChat[index].fullname.toString(),
                                                  gbr:"assets/img/user2.png",
                                                  indx:"assets/img/user2.png" + index.toString(),
                                                  id:listChat[index].id.toString())));},
                                              child: new Card(
                                                margin: new EdgeInsets.all(20.0),
                                                child: new Container(
                                                    margin: EdgeInsets.all(8.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: ListTile(
                                                    leading: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                      backgroundImage: AssetImage('assets/img/user2.png'),
                                                    ),
                                                  title: Text(
                                                    listChat[index].fullname,
                                                  ),
                                                  subtitle: Text('${listChat[index].namaProvinsi}'),
                                                  trailing: Icon(Icons.keyboard_arrow_right),
                                                ),
                                                    )),
                                              ),
                                            ),
                                          ),
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
                          )
                        : '${listChat[index].fullname}'
                                .toLowerCase()
                                .contains(filter.toLowerCase())
                            ? AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: new Stack(
                            children: <Widget>[
                              new Padding(
                                padding:
                                const EdgeInsets.only(left: 50.0),
                                child: Container(
                                  width: SizeConfig.screenWidth,
                                  child: Hero(
                                    tag: "assets/img/user2.png" + index.toString(),
                                    child: new Material(
                                      child: InkWell(
                                        onTap: (){ Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => ChatRoom(
                                            penerima:listChat[index].fullname.toString(),
                                            gbr:"assets/img/user2.png",
                                            indx:"assets/img/user2.png" + index.toString(),
                                            id:listChat[index].id.toString())));},
                                        child: new Card(
                                          margin: new EdgeInsets.all(20.0),
                                          child: new Container(
                                              margin: EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    backgroundImage: AssetImage('assets/img/user2.png'),
                                                  ),
                                                  title: Text(
                                                    listChat[index].fullname,
                                                  ),
                                                  trailing: Icon(Icons.keyboard_arrow_right),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
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
                    )
                            : new Container();
                  },
                ),
              )
            ],
          ):Container(
            height: SizeConfig.screenHight,
            child: Center(child: CircularProgressIndicator()),),
        ),
      ),
    );
  }

  void addData() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    status_login = await storage.read(key: STATUS_LOGIN);

    if (status_login == IS_STAFF) {
      ServiceApiConfig().getKontakAdmin(token).then((val) {
        setState(() {
          listChat = val.data;
        });
      }).catchError((_) {});
    } else if (status_login == IS_USER) {
      ServiceApiConfig().getKontakPic(token).then((val) {
        setState(() {
          listChat = val.data;
        });
      }).catchError((_) {});
    } else {
      ServiceApiConfig().getKontakUser(token).then((val) {
        setState(() {
          listChat = val.data;
        });
      }).catchError((_) {});
    }
  }
  String formatString(String data, int length) {
    return (data.length >= length) ? '${data.substring(0, length)}...' : data;
  }
}
