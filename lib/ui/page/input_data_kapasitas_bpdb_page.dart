import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class InputBPDBPage extends StatefulWidget {
  @override
  _InputBPDBPageState createState() => _InputBPDBPageState();
}

class _InputBPDBPageState extends State<InputBPDBPage> {
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
                        'Form Input Data Kapasitas \n BPDB',
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
                      child: Text('Ketua Pelaksana BPDB Prov, Aceh, Kab Aceh Singkil',
                        style: TextStyle(color: abuAbu, fontSize: 12),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text('Atung Nugroho',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text('Alamat Kantor',
                        style: TextStyle(color: abuAbu, fontSize: 12),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text('Jl. Putri Tunggal No 98',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 10),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.insert_drive_file_outlined,
                        color: Colors.black,
                      ),
                      hintText: "Tipe",
                      hintStyle: TextStyle(fontSize: 14, color: abuAbu)
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 10),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.insert_drive_file_outlined,
                        color: Colors.black,
                      ),
                      hintText: "Jumlah Penduduk",
                      hintStyle: TextStyle(fontSize: 14, color: abuAbu)
                  ),
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
                margin: EdgeInsets.only(left: 20,right: 20,top: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        title:
                          TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person_outline,
                                  color: Colors.black,
                                ),
                                hintText: "PNS",
                                hintStyle: TextStyle(fontSize: 16, color: abuAbu)
                            ),
                          ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        title: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              ),
                              hintText: "Non PNS",
                              hintStyle: TextStyle(fontSize: 16, color: abuAbu)
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        title: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              ),
                              hintText: "Sukarelawan",
                              hintStyle: TextStyle(fontSize: 16, color: abuAbu)
                          ),
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
              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }
}
