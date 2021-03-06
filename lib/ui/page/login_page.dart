import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sarina/data/network/responses/response_login.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/ui/page/home_page.dart';
import 'package:sarina/ui/page/register_page.dart';
import 'package:sarina/ui/widget/already_have_an_account_acheck.dart';
import 'package:sarina/ui/widget/rounded_button.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';
import 'package:sarina/utils/util_widget.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obsecure = true;

  final storage = new FlutterSecureStorage();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: blueColors,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.01),
                Image.asset(
                  'assets/img/logokm.png',
                  height: size.height * 0.2,
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  'SARANA PRASARANA DAN INFORMASI \n BENCANA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'SARINA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.01),
                TextFieldContainer(
                  child: TextField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                        ),
                        hintText: "Email",
                        hintStyle:
                            TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: passwordController,
                    obscureText: obsecure,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                      icon: Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                        icon: obsecure == true
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
                ),
                RoundedButton(
                  text: "SIGN IN",
                  press: () {
                    saveLocal(emailController.text, passwordController.text);
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveLocal(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      showToast(context, "data tidak boleh kosong");
    } else {
      ServiceApiConfig().postLogin(email, password).then((val) {
        if (val.msg == "Berhasil Login") {
          saveLocals(val);
        } else {
          showToast(context, "${val.msg}");
        }
      }).catchError((onError) {
        showToast(context, "$onError");
      });
    }
  }

  void checkUser() async {
    String status_login = await storage.read(key: STATUS_LOGIN);
    print(status_login + " sss");
    if (status_login != "STATUS_LOGIN") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    }
  }

  void saveLocals(ResponseLogin val) async {
    await storage.write(key: TOKEN_LOGIN, value: val.token);
    await storage.write(key: ID_PIC, value: val.userData.picId.toString() + "");
    await storage.write(key: ID_USER, value: val.userData.idUser.toString());
    await storage.write(key: PHONE_LOGIN, value: val.userData.noTelpon.toString());
    await storage.write(key: EMAIL_LOGIN, value: val.userData.email.toString());
    await storage.write(key: FULL_NAME_LOGIN, value: val.userData.fullname);
    if (val.userData.levelId == 1) {
      await storage.write(key: STATUS_LOGIN, value: IS_ADMIN);
    } else if (val.userData.levelId == 2) {
      await storage.write(key: STATUS_LOGIN, value: IS_STAFF);
    } else {
      await storage.write(key: STATUS_LOGIN, value: "user");
    }
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }
}
