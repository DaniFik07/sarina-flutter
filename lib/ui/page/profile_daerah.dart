import 'package:flutter/material.dart';
import 'package:sarina/ui/page/data_kapasitas_bpdb_page.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ProfileDaerahPage extends StatefulWidget {
  @override
  _ProfileDaerahPageState createState() => _ProfileDaerahPageState();
}

class _ProfileDaerahPageState extends State<ProfileDaerahPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Daerah"),
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
              Container(
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataKapasitasBPDBPage(
                              title:"Data Kapasitas BPBD"
                            )));
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
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext conext) {
                              return AlertDialog(
                                title: Text('Not in stock'),
                                content: const Text(
                                    'This item is no longer available'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Data Kapasitas BPBD',
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
              SizedBox(
                height: 10,
              ),
              Container(
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataKapasitasBPDBPage(
                                title:"Data Sarana Prasarana"
                            )));
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
                          child: Text('Data Sarana Prasarana',
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
              SizedBox(
                height: 10,
              ),
              Container(
                height: 130,
                child: Card(
                  color: Colors.blue,
                  elevation: 10,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {},
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
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext conext) {
                              return AlertDialog(
                                title: Text('Not in stock'),
                                content: const Text(
                                    'This item is no longer available'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Informasi Bencana',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
