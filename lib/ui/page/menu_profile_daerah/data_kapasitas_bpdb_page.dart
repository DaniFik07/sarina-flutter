import 'package:flutter/material.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

import 'provinsi_page.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class DataKapasitasBPDBPage extends StatefulWidget {
  String title="";
  DataKapasitasBPDBPage({this.title});

  @override
  _DataKapasitasBPDBPageState createState() => _DataKapasitasBPDBPageState();
}

class _DataKapasitasBPDBPageState extends State<DataKapasitasBPDBPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kapasitas BPDB', style: TextStyle(),),
      ),
      body: Container(
        child: Column(
          children: [
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Aceh',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProvinsiPage(title:widget.title)));
                },
            ),
            ListTile(
              title: Text(
                'Depok',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProvinsiPage(title:widget.title)));},
            ),
            ListTile(
              title: Text(
                'Jakarta',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProvinsiPage(title:widget.title)));},
            ),
          ],
        ),
      ),
    );
  }
}
