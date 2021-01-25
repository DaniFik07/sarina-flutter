import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/ui/page/login_page.dart';
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
  String pangkat = "";
  String instansi = "";
  String status_login = "";
  String telephone_number = "";
  TextEditingController emailController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController hpController = new TextEditingController();
  String nominal = "";
  String fullname = "";
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    getProfile();
    setState(() {
      emailController.text = "bayu404.dart@gmail.com";
      hpController.text = "082125990090";
      alamatController.text = "jl. Putri Tunggal";
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
            logout();
          },
          backgroundColor: Colors.red,
          label: Container(
            width: SizeConfig.screenWidth / 1.3,
            child: Text(
              "Logout",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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
                    color: Colors.white,
                    width: double.infinity,
                    // width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHight / 3.2,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.only(top: 10)),
                          Text(
                            "MY PROFILE",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          CircleAvatar(
                            backgroundColor: blueColors,
                            backgroundImage: AssetImage(
                              "assets/img/user.png",
                            ),
                            radius: 40.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "$fullname",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Container(
                color: Colors.grey[200],
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
                            '$status_login',
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
                            '$pangkat',
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
                            '$instansi',
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
                    color: whiteColor,
                  ),
                  Column(
                    children: [
                      Container(
                        width: SizeConfig.screenHight,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
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
                      Container(
                        width: SizeConfig.screenHight,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
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
                      Container(
                        width: SizeConfig.screenHight,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: alamatController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              hintText: "-",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.person),
                              ),
                              border: InputBorder.none,
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

  void logout() async {
    await storage.write(key: STATUS_LOGIN, value: "STATUS_LOGIN");
    await storage.delete(key: IS_ADMIN);
    await storage.delete(key: IS_STAFF);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  void getProfile() async {
    String pic_id = await storage.read(key: ID_PIC);
    String token = await storage.read(key: TOKEN_LOGIN);
    status_login = await storage.read(key: STATUS_LOGIN);
    fullname = await storage.read(key: FULL_NAME_LOGIN);
    print(status_login + "bayunugroho404");
    setState(() {
    });
    hpController.text = await storage.read(key: PHONE_LOGIN);
    emailController.text = await storage.read(key: EMAIL_LOGIN);
    alamatController.text = await storage.read(key: FULL_NAME_LOGIN);
    // String phone = await storage.read(key: PHONE_LOGIN);
    ServiceApiConfig().getPicById(pic_id, token).then((value) {
        setState(() {
          instansi = value.data[0].namaProvinsi;
          pangkat = value.data[0].fullname;
        });
        print(value.data[0].fullname +" dataaaaa");
    }).catchError((onError) {});
  }
}
