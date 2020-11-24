import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarina/ui/page/login_page.dart';
import 'package:sarina/utils/constants.dart';

class Splash extends StatefulWidget{
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{
  startTime() async{
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, LoginPage);
  }

  void LoginPage(){
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void initState(){
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: biruTua,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('SELAMAT DATANG',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                SizedBox(height: 30),
                Text('SARINA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
                SizedBox(height: 30),
                Text('SARANA PRASARANA DAN INFORMASI \n BENCANA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize:16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold ),),
                SizedBox(height: 15),
                Image.asset('assets/img/logokm.png', height: 200, width: 155, alignment: Alignment.center,),
                SizedBox(height: 30,),
                Text('KEMENTRIAN DALAM NEGERI \n REPUBLIK INDONESIA',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold ),)
              ],
            ),)
        ),
      )

    );
  }
}
