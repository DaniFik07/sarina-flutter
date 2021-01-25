import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sarina/ui/page/chat_page/screens/chat_home_screen.dart';
import 'package:sarina/ui/page/dashboard_page.dart';
import 'package:sarina/ui/page/profile_page.dart';
import 'package:sarina/utils/constants.dart';

import 'chat_bayu_page/index_page.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */


class HomePage extends StatefulWidget {
  int page;
  HomePage({this.page});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    if(widget.page!=null){
      setState(() {
        _page = _page;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page== null?0:_page,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home_filled,color: whiteColor, size: 30),
            Icon(Icons.chat, color: whiteColor, size: 30,),
            Icon(Icons.person,color: whiteColor, size: 30),
            // Icon(Icons.settings,color: blueColors, size: 30),
          ],
          color: blueColors,
          buttonBackgroundColor: blueColors,
          backgroundColor: whiteColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: body());
  }

  Widget body() {
    switch (_page) {
      case 0:
        return DashboardPage();
        break;
      case 1:
        return ChatBayuPage();
        break;
      case 2:
        return ProfilePage();
        break;

    }
  }

  void goToWidget2(int index) {
    setState(() {
      _page = 1;
    });
  }
}
