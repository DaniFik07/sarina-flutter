import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarina/ui/page/input_data_kapasitas_bpdb_page.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ProvinsiPage extends StatefulWidget {
  @override
  _ProvinsiPageState createState() => _ProvinsiPageState();
}

class _ProvinsiPageState extends State<ProvinsiPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama Provinsi'),
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
                'Kab. Simeulue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InputBPDBPage()));
              },
            ),
            ListTile(
              title: Text(
                'Kab. Aceh Sungkil',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InputBPDBPage()));
              },
            ),
            ListTile(
              title: Text(
                'Kab. Aceh Selatan',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InputBPDBPage()));
              },
            ),
            ListTile(
              title: Text(
                'Kab. Aceh Selatan 2 ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InputBPDBPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
