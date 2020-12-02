import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sarina/models/dropdown_model.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */


class FormInputKegiatan extends StatefulWidget {
  String title ="";
  FormInputKegiatan({this.title});

  @override
  _FormInputKegiatanState createState() => _FormInputKegiatanState();
}

class _FormInputKegiatanState extends State<FormInputKegiatan> {
  String jenisAnggaran = "-- Pilih --";
  List<Example> listExample = [];
  int clan;


  @override
  void initState() {
    addDataDropdown();
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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHight / 7,
                    color: blueColors,
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHight / 18),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Form Input Kegiatan',
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
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                          child: Text(
                            'Jenis Kegiatan',
                            style: TextStyle(color: abuAbu),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                child: DropdownButton(
                                  isExpanded: true,
                                  hint: Text("Marga"),
                                  value: clan,
                                  items: listExample.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item.name),
                                      value: item.id,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      clan = value;
                                    });
                                  },
                                )),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                          child: Text(
                            '${widget.title}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: SizeConfig.screenWidth * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.book,
                            color: Colors.black,
                          ),
                          hintText: "Nama Kegiatan",
                          hintStyle: TextStyle(fontSize: 16, color: abuAbu)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    child: Text(
                      'Sumber Anggaran',
                      style: TextStyle(color: abuAbu),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 8, 15, 0),
                    child: Container(
                      width: SizeConfig.screenWidth /1.7,
                      child: DropdownButton(
                        elevation: 5,
                        hint: Text('------'),
                        dropdownColor: Colors.grey[200],
                        isExpanded: true,
                        items: [
                          DropdownMenuItem<String>(
                            value: "-- Pilih --",
                            child: Text(
                              "-- Pilih --",style: TextStyle(color: Colors.black),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Tes1",
                            child: Text(
                              "Tes1",
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Tes2",
                            child: Text(
                              "Tes2",
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            jenisAnggaran = value;
                          });
                        },
                        value: jenisAnggaran,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: SizeConfig.screenWidth * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.timelapse,
                            color: Colors.black,
                          ),
                          hintText: "Progress Kegiatan",
                          hintStyle: TextStyle( fontSize: 16, color: abuAbu)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    child: Text(
                      'Deskripsi Kegiatan',
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
                  SizedBox(height: 100,)
                ],
              ),
            ),
            Positioned(
              top: 36,
              child: InkWell(
                onTap: (){Navigator.pop(context);},
                child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        child: Icon(Icons.arrow_back,color:blueColors,size: 30,))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addDataDropdown() {
    setState(() {
      listExample.add(new Example(
        id: 1,
        name: "tes 1"
      ));

      listExample.add(new Example(
        id: 2,
        name: "tes 2"
      ));
    });
  }
}