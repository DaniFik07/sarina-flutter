import 'package:flutter/material.dart';
import 'package:sarina/ui/page/provinsi_page.dart';
import 'package:sarina/ui/page/provinsi_page_sarana.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

class DataSaranaPrasaranaPage extends StatefulWidget{
  String title ="";
  DataSaranaPrasaranaPage({this.title});

  @override
  _DataSaranaPrasaranaPageState createState() => _DataSaranaPrasaranaPageState();
}

class  _DataSaranaPrasaranaPageState extends State<DataSaranaPrasaranaPage>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Provinsi', style: TextStyle(fontFamily: "fonts/Montserrat-Bold.ttf"),),
      ),
      body: Container(
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
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Cari",
                          hintStyle: TextStyle(
                              fontFamily: "fonts/Montserrat-Bold.ttf",
                              fontSize: 16),
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
            ListTile(
              title: Text(
                'Aceh',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProvinsiPageSarana(title:widget.title)));
              },
            ),
            ListTile(
              title: Text(
                'Depok',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProvinsiPage(title:widget.title)));},
            ),
            ListTile(
              title: Text(
                'Jakarta',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "fonts/Montserrat-Bold.ttf"),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProvinsiPage(title:widget.title)));},
            ),
          ],
        ),
      ),
    );
  }
}

