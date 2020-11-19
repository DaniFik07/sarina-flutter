import 'package:flutter/material.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

import 'input_data_kapasitas_bpdb_page.dart';
import 'input_sarana_prasarana.dart';

class ProvinsiPageSarana extends StatefulWidget {
  String title = "";

  ProvinsiPageSarana({this.title});

  @override
  _ProvinsiPageSaranaState createState() => _ProvinsiPageSaranaState();
}

class _ProvinsiPageSaranaState extends State<ProvinsiPageSarana> {
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
