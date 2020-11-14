import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";
  String email = "";
  String no_kk = "";
  String userId = "";
  String telephone_number = "";
  TextEditingController emailController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController hpController = new TextEditingController();
  String nominal = "";
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    setState(() {
      emailController.text ="atung@gmail.com";
      hpController.text ="08212122233";
      alamatController.text ="jl. Putri Tunggal";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          elevation: 3,
          onPressed: () {
          },
          backgroundColor: redColors,
          label: Container(
            width: SizeConfig.screenWidth / 1.3,
            child: Text(
              "Logout",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "fonts/Montserrat-Bold.ttf",
                  fontSize: 16),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [whiteColor, whiteColor])),
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHight / 3,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "MY PROFILE",
                            style: TextStyle(
                              fontSize: SizeConfig.blockVertical * 4,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          CircleAvatar(
                            backgroundColor: whiteColor,
                            backgroundImage: AssetImage(
                              "assets/img/user.png",
                            ),
                            radius: 40.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Atung Nugroho",
                            style: TextStyle(
                              fontSize: SizeConfig.blockVertical * 3,
                              color: abuAbu,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  )),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Text('Jabatan'),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'User',
                            style: TextStyle(color: blueColors),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Text('Pangkat'),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '-',
                            style: TextStyle(color: blueColors),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Text('Instansi'),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '-',
                            style: TextStyle(color: blueColors),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: SizeConfig.screenHight / 2,
                    color: blueColors,
                  ),
                  Column(
                    children: [
                      Container(
                        width: SizeConfig.screenHight,
                        child: Padding(
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
                              controller: emailController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "-",
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.mail),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: SizeConfig.screenHight,
                        child: Padding(
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
                              controller: hpController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                labelText: "No HP",
                                hintText: "-",
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.call),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: SizeConfig.screenHight,
                        child: Padding(
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
                              controller: alamatController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                labelText: "Alamat",
                                hintText: "-",
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.location_on),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
