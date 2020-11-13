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
                'Kab. Simeulue',
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
