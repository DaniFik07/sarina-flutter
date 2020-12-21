

import 'package:flutter/material.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/ui/widget/already_have_an_account_acheck.dart';
import 'package:sarina/ui/widget/rounded_button.dart';
import 'package:sarina/ui/widget/rounded_button_blue.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/ui/widget/text_field_container_white.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/util_widget.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obsecure = true;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController cPasswordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController noController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height / 20),
                Image.asset('assets/img/logokm.png',
                  height: size.height * 0.17,
                ),
                SizedBox(height: size.height * 0.02),
                Text('SARANA PRASARANA DAN \n INFORMASI BENCANA',textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: size.height * 0.01),
                TextFieldContainerWhite(
                  child: TextField(
                    controller: usernameController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      hintText: "Nama",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldContainerWhite(
                  child: TextField(
                    controller: noController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone_iphone_sharp,
                        color: Colors.black,
                      ),
                      hintText: "Nomor Telepon",
                      border: InputBorder.none,
                    ),
                  ),
                ), TextFieldContainerWhite(
                  child: TextField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.alternate_email_outlined,
                        color: Colors.black,
                      ),
                      hintText: "Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldContainerWhite(
                  child: TextField(
                    controller: passwordController,
                    obscureText: obsecure,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(
                        Icons.vpn_key,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          obsecure = !obsecure;
                        });
                      }, icon: obsecure == true?Icon(Icons.visibility):Icon(Icons.visibility_off),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldContainerWhite(
                  child: TextField(
                    controller: cPasswordController,
                    obscureText: obsecure,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      icon: Icon(
                        Icons.vpn_key,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() {
                          obsecure = !obsecure;
                        });
                      }, icon: obsecure == true?Icon(Icons.visibility):Icon(Icons.visibility_off),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                RoundedButtonBlue(
                  color: greenColors,
                  text: "SIGN UP",
                  press: () {
                    doRegister(usernameController.text,passwordController.text,cPasswordController.text,emailController.text,noController.text);
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: size.height * 0.03),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void doRegister(String username, String password, String cpassword, String email, String no) {
    if(username.isEmpty ||password.isEmpty ||cpassword.isEmpty ||email.isEmpty ||no.isEmpty ){
      showToast(context, "data tidak boleh kosong");
    }else if(password!=cpassword){
      showToast(context, "password harus sama");
    }else{
      ServiceApiConfig().postRegister(username, password, email, no).then((value){
        Navigator.pop(context);
        showToast(context, "berhasil register");
      }).catchError((onError){
        showToast(context, "$onError");
      });
    }
  }
}
