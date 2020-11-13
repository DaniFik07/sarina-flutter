import 'package:flutter/material.dart';
import 'package:sarina/ui/page/provinsi_page.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

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
        title: Text('Data Kapasitas BPDB'),
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
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          hintText: "Cari",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
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
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProvinsiPage(title:widget.title)));},
            ),
            ListTile(
              title: Text(
                'Jakarta',
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
