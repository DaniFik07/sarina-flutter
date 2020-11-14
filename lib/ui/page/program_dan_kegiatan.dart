/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:sarina/ui/page/data_kapasitas_bpdb_page.dart';
import 'package:sarina/ui/page/form_input_kegiatan.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ProgramDanKegiatan extends StatefulWidget {
  @override
  _ProgramDanKegiatanState createState() => _ProgramDanKegiatanState();
}

class _ProgramDanKegiatanState extends State<ProgramDanKegiatan> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Program dan Kegiatan"),
        centerTitle: true,
      ),
      body: Container(
        height: SizeConfig.screenHight,
        color: blueColors,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormInputKegiatan(
                    title:"Pusat"
                )));},
                child: Container(
                  height: 130,
                  child: Card(
                    color: Colors.blue,
                    elevation: 10,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                  color: orangeColor,
                                  image: DecorationImage(
                                      image: AssetImage('assets/icons/dossier.png'),
                                      fit: BoxFit.cover
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(75.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7.0, color: Colors.black)
                                  ]),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text('Pusat',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "fonts/Montserrat-Bold.ttf",
                                  fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormInputKegiatan(
                    title:"Daerah"
                )));},
                child: Container(
                  height: 130,
                  child: Card(
                    color: Colors.blue,
                    elevation: 10,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                  color: orangeColor,
                                  image: DecorationImage(
                                      image:
                                      AssetImage('assets/icons/dossier.png'),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(75.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7.0, color: Colors.black)
                                  ]),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text('Daerah',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: "fonts/Montserrat-Bold.ttf",
                                  fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}