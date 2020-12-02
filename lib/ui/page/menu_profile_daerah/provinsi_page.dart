import 'package:flutter/material.dart';
import 'file:///C:/Users/dwika/Documents/GitHub/sarina/lib/ui/page/menu_profile_daerah/input_data_kapasitas_bpdb_page.dart';
import 'file:///C:/Users/dwika/Documents/GitHub/sarina/lib/ui/page/menu_profile_daerah/input_informasi_bencana.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

import 'input_sarana_prasarana.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ProvinsiPage extends StatefulWidget {
  String title = "";

  ProvinsiPage({this.title});

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
        child: SingleChildScrollView(
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
                  if (widget.title == "Data Kapasitas BPBD") {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => InputBPDBPage()));
                  } else if (widget.title == "Data Sarana Prasarana") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InputSaranaPrasaranaPage()));
                  }else if (widget.title == "Data Informasi Bencana"){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InformasiBencanaPage()));
                  }
                },
              ),
              ListTile(
                title: Text(
                  'Kab. Aceh Sungkil',
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  if (widget.title == "Data Kapasitas BPBD") {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => InputBPDBPage()));
                  } else if (widget.title == "Data Sarana Prasarana") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InputSaranaPrasaranaPage()));
                  }else if (widget.title == "Data Informasi Bencana"){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InformasiBencanaPage()));
                  }
                },
              ),
              ListTile(
                title: Text(
                  'Kab. Aceh Selatan',
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  if (widget.title == "Data Kapasitas BPBD") {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => InputBPDBPage()));
                  } else if (widget.title == "Data Sarana Prasarana") {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InputSaranaPrasaranaPage()));
                  }else if (widget.title == "Data Informasi Bencana"){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InformasiBencanaPage()));
                  }
                },
              ),
              ListTile(
                title: Text(
                  'Kab. Aceh Selatan 2 ',
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  if(widget.title =="Data Kapasitas BPBD"){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InputBPDBPage()));
                  }else if(widget.title == "Data Sarana Prasarana"){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InputSaranaPrasaranaPage()));
                  }else if (widget.title == "Data Informasi Bencana"){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InformasiBencanaPage()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
