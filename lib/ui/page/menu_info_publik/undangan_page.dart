import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/models/model_home.dart';
import 'package:sarina/ui/page/detail/detail_undangan.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/refresh.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class DaftarUndanganPage extends StatefulWidget {
  @override
  _DaftarUndanganPageState createState() => _DaftarUndanganPageState();
}

class _DaftarUndanganPageState extends State<DaftarUndanganPage> {
  Color red800 = Colors.red[800];
  List<ModelItemUndangan> modelItemUndanganList = [];
  String status_login = "";
  String id_pic = "";
  final storage = new FlutterSecureStorage();
  final _debouncer = Debouncer(milliseconds: 500);
  List<ModelItemUndangan> filteredData = List();


  @override
  void initState() {
    addData();
    checkRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Visibility(
          visible: false,
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
      ),
      appBar: AppBar(
        title: Text('Daftar Undangan', style: TextStyle(),),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Visibility(
                visible: false,
                child: Container(
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
                            onChanged: (string) {
                              _debouncer.run(() {
                                setState(() {
                                  filteredData = modelItemUndanganList
                                      .where((u) => (u.judul
                                      .toLowerCase()
                                      .contains(string.toLowerCase()) ||
                                      u.Deskripsi
                                          .toLowerCase()
                                          .contains(string.toLowerCase())))
                                      .toList();
                                });
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: SizeConfig.screenHight /1.1,
                width: SizeConfig.screenWidth,
                child: filteredData.length> 0?ListView.builder(
                  itemCount: filteredData.length,
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
                                child: InkWell(
                                  onTap: (){
                                    print(id_pic +" \n"+ modelItemUndanganList[index].pic_id +"\n"+ status_login );
                                    if(id_pic == filteredData[index].pic_id || status_login == IS_ADMIN){
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => DetailUndanganPage(
                                        modelItemUndangan:filteredData[index],status :"ketua"
                                      )));
                                    }else{
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => DetailUndanganPage(
                                          modelItemUndangan:filteredData[index],status :"bukan ketua"
                                      )));
                                    }
                                  },
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
                                                    filteredData[index].judul),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(4.0),
                                                child: Text(
                                                    "Event Type : " +filteredData[index].eventType),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(4.0),
                                                child: Row(
                                                  children: [
                                                    Text("Tanggal Pelaksanaan : "),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Card(color:greenColors,
                                                          child: Text("${filteredData[index].tglPelaksanan} "
                                                              "",style: TextStyle(color: whiteColor),),),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(4.0),
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.horizontal,
                                                  child: Row(
                                                    children: [
                                                      Text("Waktu Pelaksanaan : "),
                                                      Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: Card(color:orangeColor,
                                                          child: Text("${filteredData[index].WaktuPelaksana} ",
                                                            style: TextStyle(color: whiteColor),),),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
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
                ):Container(
                    height:100,width: 100,child: Center
                  (child: CircularProgressIndicator())),
              ),
            ],
          ),
        )
      ),
    );
  }

  void addData() async{
    String token = await storage.read(key: TOKEN_LOGIN);
    id_pic = await storage.read(key: ID_PIC);
    ServiceApiConfig().getAllKegiatan(token).then((val){
      if(val.data != null){
        for(int i =0; i< val.data.length;i++){
          setState(() {
            modelItemUndanganList.add(new ModelItemUndangan(
                id: val.data[i].id.toString(),
                judul: val.data[i].eventName,
                Deskripsi: val.data[i].eventDescription,
                tglPelaksanan: val.data[i].eventDate.toString().replaceAll("00:00:00.000Z", ""),
                WaktuPelaksana: val.data[i].eventTime,
                eventType: val.data[i].eventType,
                pic_id: val.data[i].picId.toString()
            ));
          });
        }
        setState(() {
          filteredData= modelItemUndanganList;
        });
        print(filteredData.length.toString());
        print(modelItemUndanganList.length.toString());
      }
    }).catchError((onError){
    });
  }
  void checkRole() async{
    status_login = await storage.read(key: STATUS_LOGIN);
    setState(() {});
  }
}
