import 'package:flutter/material.dart';
import 'package:sarina/splash.dart';
import 'package:sarina/ui/page/login_page.dart';
import 'package:sarina/ui/page/screen_chat/home_screen_chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sarina',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: LoginPage(),
      // home: HomeScreen(),
      home: Splash(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => LoginPage(),
      }
    );
  }
}
