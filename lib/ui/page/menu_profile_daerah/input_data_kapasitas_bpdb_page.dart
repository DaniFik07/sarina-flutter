import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/ui/page/home_page.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';
import 'package:sarina/utils/util_widget.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class InputBPDBPage extends StatefulWidget {
  String title;
  String kab_id;
  String kab = "";
  String prov = "";
  String prov_id = "";

  InputBPDBPage({this.title, this.kab_id, this.kab, this.prov,this.prov_id});

  @override
  _InputBPDBPageState createState() => _InputBPDBPageState();
}

class _InputBPDBPageState extends State<InputBPDBPage> {
  final storage = new FlutterSecureStorage();
  String name = "";
  String id_pic = "";
  TextEditingController tipeController = new TextEditingController();
  TextEditingController jumlahPendudukController = new TextEditingController();
  TextEditingController pnsController = new TextEditingController();
  TextEditingController nonPnsController = new TextEditingController();
  TextEditingController sukarelawanController = new TextEditingController();
  TextEditingController lainnyaController = new TextEditingController();
  TextEditingController dasarPembentukanController = new TextEditingController();
  TextEditingController deskController = new TextEditingController();
  String tahun = "2020";
  String address = "";

  @override
  void initState() {
    getPic();
    getSubmitBPBD();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(title: Text(''),
      //   elevation: 0,),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          elevation: 3,
          onPressed: () {
            doSubmit();
          },
          backgroundColor: greenColors,
          label: Container(
            width: SizeConfig.screenWidth / 1.3,
            child: Text(
              "SUBMIT",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHight / 5,
                color: blueColors,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: SizeConfig.screenHight / 18),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Form Input Data Kapasitas \n BPBD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                width: SizeConfig.screenWidth,
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        'Ketua Pelaksana BPBD Prov, ${widget.prov}, Kab ${widget.kab}',
                        style: TextStyle(color: abuAbu, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        '$name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        'Alamat Kantor',
                        style: TextStyle(color: abuAbu, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        '$address',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.date_range),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Tahun : '),
                      Container(
                        child: DropdownButton(
                          elevation: 5,
                          hint: Text('Tahun'),
                          dropdownColor: Colors.grey[200],
                          items: [
                            DropdownMenuItem<String>(
                              value: "2020",
                              child: Text(
                                "2020",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "2021",
                              child: Text(
                                "2021",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "2022",
                              child: Text(
                                "2022",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              tahun = value;
                            });
                          },
                          value: tahun,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: TextField(
                  controller: tipeController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.insert_drive_file_outlined,
                        color: Colors.black,
                      ),
                      hintText: "Tipe",
                      hintStyle: TextStyle(fontSize: 14, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: jumlahPendudukController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.insert_drive_file_outlined,
                        color: Colors.black,
                      ),
                      hintText: "Jumlah Penduduk",
                      hintStyle: TextStyle(fontSize: 14, color: abuAbu)),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 20.0),
                child: Text(
                  'Jumlah Personil',
                  style: TextStyle(color: abuAbu),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        title: TextField(
                          controller: pnsController,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              ),
                              hintText: "PNS",
                              hintStyle:
                                  TextStyle(fontSize: 16, color: abuAbu)),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        title: TextField(
                          controller: nonPnsController,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              ),
                              hintText: "Non PNS",
                              hintStyle:
                                  TextStyle(fontSize: 16, color: abuAbu)),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        title: TextField(
                          controller: sukarelawanController,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              ),
                              hintText: "Sukarelawan",
                              hintStyle:
                                  TextStyle(fontSize: 16, color: abuAbu)),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        title: TextField(
                          controller: lainnyaController,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              ),
                              hintText: "Lainnya",
                              hintStyle:
                                  TextStyle(fontSize: 16, color: abuAbu)),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        title: TextField(
                          controller: dasarPembentukanController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.map,
                                color: Colors.black,
                              ),
                              hintText: "Dasar Pembentukan",
                              hintStyle:
                                  TextStyle(fontSize: 16, color: abuAbu)),
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                child: Text(
                  'Keterangan',
                  style: TextStyle(color: abuAbu),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  minLines: 10,
                  maxLines: 15,
                  controller: deskController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Deskripsikan di sini..',
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  void getPic() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    String pic_id = await storage.read(key: ID_PIC);
    ServiceApiConfig().getPicById(pic_id, token).then((val) {
      if (val.data.length > 0) {
        setState(() {
          name = val.data[0].fullname;
          id_pic = val.data[0].picId.toString();
          address = val.data[0].alamat;
        });
      }
    }).catchError((_) {});
  }

  void doSubmit() async{
    String token = await storage.read(key: TOKEN_LOGIN);
    String id_user = await storage.read(key: ID_USER);
    var now = DateTime.now();
    String mydate = DateFormat('yyyy-MM-dd hh:mm:ss').format(now);

    ServiceApiConfig().submitBPBDCapacity(
        token,
        widget.prov_id,
        widget.kab_id,
        id_user,
        id_pic,
        "null",
        tipeController.text,
        pnsController.text,
        nonPnsController.text,
        sukarelawanController.text,
        lainnyaController.text,
        dasarPembentukanController.text,
        deskController.text,
        tahun,
        mydate
    ).then((val){
          if(val.msg== "Form Submitted"){
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) => HomePage() ));
          }else{
            showToast(context, "${val.msg}");
          }
    }).catchError((d){
      showToast(context, "${d}");
    });
  }

  void getSubmitBPBD() async{
    String token = await storage.read(key: TOKEN_LOGIN);
    ServiceApiConfig().getSubmitBPBD(token, widget.kab_id).then((val){
      if(val.data != null){
      tipeController.text = "${val.data[0].type.toString()}";
      pnsController.text= "${val.data[0].pns.toString()}";
      nonPnsController.text= "${val.data[0].nonPns.toString()}";
      sukarelawanController.text= "${val.data[0].volunteer.toString()}";
      lainnyaController.text= "${val.data[0].lainnya.toString()}";
      dasarPembentukanController.text= "${val.data[0].basicFormation.toString()}";
      deskController.text = "${val.data[0].description.toString()}";
      }
    }).catchError((eror){

    });
  }
}
