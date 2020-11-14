import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
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
                  fontFamily: "fonts/Montserrat-Bold.ttf",
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
                                fontSize: 30,
                                fontFamily: "fonts/Montserrat-Bold.ttf",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    child: Text(
                      'Jenis Kegiatan',
                      style: TextStyle(color: abuAbu),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    child: Text(
                      '${widget.title}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: "fonts/Montserrat-Regular.ttf",
                          fontWeight: FontWeight.normal),
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
                            color: blueColors,
                          ),
                          hintText: "Nama Kegiatan",
                          hintStyle: TextStyle(fontFamily: "fonts/Montserrat-Bold.ttf", fontSize: 16, color: abuAbu)
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
                        dropdownColor: Colors.grey,
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
                            Icons.dashboard,
                            color: blueColors,
                          ),
                          hintText: "Program Kegiatan",
                          hintStyle: TextStyle(fontFamily: "fonts/Montserrat-Bold.ttf", fontSize: 16, color: abuAbu)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      minLines: 10,
                      maxLines: 15,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'Write your status here',
                        filled: true,
                        fillColor: Color(0xFFDBEDFF),
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
}