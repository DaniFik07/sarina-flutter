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
  @override
  _DataKapasitasBPDBPageState createState() => _DataKapasitasBPDBPageState();
}

class _DataKapasitasBPDBPageState extends State<DataKapasitasBPDBPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kapasitas BPDB', style: TextStyle(fontFamily: "fonts/Montserrat-Bold.ttf"),),
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
                    child: TextFieldContainer(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Cari",
                            hintStyle: TextStyle(
                                fontFamily: "fonts/Montserrat-Bold.ttf",
                                fontSize: 16,
                                color: Colors.white),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search_outlined,
                              color: Colors.white,),
                          ),
                          // border: InputBorder.none,
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
                    color: Colors.black,
                    fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () { Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProvinsiPage()));},
            ),
            ListTile(
              title: Text(
                'Depok',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () { Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProvinsiPage()));},
            ),
            ListTile(
              title: Text(
                'Jakarta',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () { Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProvinsiPage()));},
            ),
          ],
        ),
      ),
    );
  }
}
