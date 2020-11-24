import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarina/ui/page/home_page.dart';
import 'package:sarina/ui/page/register_page.dart';
import 'package:sarina/ui/widget/already_have_an_account_acheck.dart';
import 'package:sarina/ui/widget/rounded_button.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

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
                Text('SARANA PRASARANA DAN INFORMASI \n BENCANA',textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: size.height * 0.01),
                Text('SARINA', textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: size.height * 0.01),
                TextFieldContainer(
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.white)
                    ),
                  ),
                ),
                TextFieldContainer(
                  child: TextField(
                    obscureText: obsecure,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle( fontSize: 16, color: Colors.white),
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
                Text('Forgot Password?',
                  style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic
                  ),),
                RoundedButton(
                  text: "SIGN IN",
                  press: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
