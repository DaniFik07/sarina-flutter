import 'package:flutter/material.dart';
import 'package:sarina/data/network/responses/response_province.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/refresh.dart';
import 'package:sarina/utils/size_config.dart';
import 'provinsi_page.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class DataKapasitasBPDBPage extends StatefulWidget {
  String title = "";

  DataKapasitasBPDBPage({this.title});

  @override
  _DataKapasitasBPDBPageState createState() => _DataKapasitasBPDBPageState();
}

class _DataKapasitasBPDBPageState extends State<DataKapasitasBPDBPage> {
  List<Datum> list_province = [];
  TextEditingController searchController = new TextEditingController();
  String filter;

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
    getProvince();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Kapasitas BPBD',
          style: TextStyle(),
        ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: searchController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Cari",
                            hintStyle: TextStyle(fontSize: 16),
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
              buildListProvince(),
            ],
          ),
        ),
      ),
    );
  }

  void getProvince() {
    ServiceApiConfig().getProvince().then((val) {
      setState(() {
        list_province = val.data;
      });
    }).catchError((_) {});
  }

  Widget buildListProvince() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: ListView.builder(
          itemCount: list_province.length,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, i) {
            return filter == null || filter == ""
                ? Center(
                    child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          '${list_province[i].provincesName}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProvinsiPage(
                                  title: widget.title,
                                  id_prov: list_province[i].id.toString(),
                                  name: list_province[i].provincesName)));
                        },
                      ),
                    ),
                  ))
                : '${list_province[i].provincesName}'
                        .toLowerCase()
                        .contains(filter.toLowerCase())
                    ? Center(
                        child: Center(
                        child: InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                              '${list_province[i].provincesName}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProvinsiPage(
                                      title: widget.title,
                                      id_prov: list_province[i].id.toString(),
                                      name: list_province[i].provincesName)));
                            },
                          ),
                        ),
                      ))
                    : Container();
          }),
    );
  }

  Future<List<Datum>> get_province() async {
    return new Future.delayed(new Duration(seconds: 3), () {
      return list_province;
    });
  }
}
