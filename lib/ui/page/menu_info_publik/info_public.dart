import 'package:flutter/material.dart';
import 'package:sarina/ui/page/menu_info_publik/undangan_page.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class InfoPublicPage extends StatefulWidget {
  @override
  _InfoPublicPageState createState() => _InfoPublicPageState();
}

class _InfoPublicPageState extends State<InfoPublicPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Info Public"),
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
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DaftarUndanganPage(
                )));},
                child: Container(
                  height: 100,
                  child: Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                  color: orangeColor,
                                  image: DecorationImage(
                                      image: AssetImage('assets/icons/Artboard – 11.png'),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Undangan',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),),
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
                onTap: (){
                //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormInputKegiatan(
                //     title:"Galeri"
                // )));
                  },
                child: Container(
                  height: 100,
                  child: Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                  color: orangeColor,
                                  image: DecorationImage(
                                      image:
                                      AssetImage('assets/icons/Artboard – 11.png'),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Galeri',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),),
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
