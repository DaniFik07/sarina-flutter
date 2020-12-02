import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sarina/ui/page/menu_profile_daerah/data_informasi_bencana.dart';
import 'package:sarina/ui/page/menu_profile_daerah/data_sarana_prasarana_page.dart';
import 'package:sarina/ui/page/menu_profile_daerah/input_data_kapasitas_bpdb_page.dart';
import 'package:sarina/ui/page/menu_profile_daerah/input_informasi_bencana.dart';
import 'package:sarina/ui/page/menu_profile_daerah/input_sarana_prasarana.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

import 'data_kapasitas_bpdb_page.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class ProfileDaerahPage extends StatefulWidget {
  @override
  _ProfileDaerahPageState createState() => _ProfileDaerahPageState();
}

class _ProfileDaerahPageState extends State<ProfileDaerahPage> {

  String status_login = "";
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    chekRole();
    //cek role sebelm widget dibangun / pertama kali page ini di jalankan
    super.initState();
  }

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
                height: 100,
                child: InkWell(
                  onTap: () {
                    if (status_login == IS_ADMIN) {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DataKapasitasBPDBPage(
                                      title: "Data Kapasitas BPBD")));
                    } else if (status_login == IS_STAFF) {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DataKapasitasBPDBPage(
                                      title: "Data Kapasitas BPBD")));
                    }else{
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>
                              InputBPDBPage()));
                    }
                  },
                  child: Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: kuningColor,
                                image: DecorationImage(
                                    image: AssetImage('assets/icons/copy.png'),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Data Kapasitas BPBD',
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
              Container(
                height: 100,
                child: InkWell(
                  onTap: (){
                    if (status_login == IS_ADMIN) {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DataSaranaPrasaranaPage(
                                      title: "Data Sarana Prasarana")));
                    } else if (status_login == IS_STAFF) {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DataSaranaPrasaranaPage(
                                      title: "Data Sarana Prasarana")));
                    }else{
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>
                              InputSaranaPrasaranaPage()));
                    }
                  },
                  child: Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: kuningColor,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/icons/copy.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(75.0)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7.0, color: Colors.black)
                                ]),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text('Data Sarana Prasarana',
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
              Container(
                height: 100,
                child: InkWell(
                  onTap: (){
                    if (status_login == IS_ADMIN) {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DataInformasiBencanaPage(
                                      title: "Data Informasi Bencana")));
                    } else if (status_login == IS_STAFF) {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DataInformasiBencanaPage(
                                      title: "Data Informasi Bencana")));
                    }else{
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>
                              InformasiBencanaPage()));
                    }
                    },
                  child: Card(
                    color: Colors.blue,
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: kuningColor,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/icons/copy.png'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(75.0)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7.0, color: Colors.black)
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Informasi Bencana',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void chekRole() async{
    //baca vale dari kunci STATuS_LOGIN
    status_login = await storage.read(key: STATUS_LOGIN);
    setState(() {});
  }
}