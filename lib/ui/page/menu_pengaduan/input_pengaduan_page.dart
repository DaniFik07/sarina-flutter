import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class InputPengaduanPage extends StatefulWidget {
  @override
  _InputPengaduanPageState createState() => _InputPengaduanPageState();
}

class _InputPengaduanPageState extends State<InputPengaduanPage> {
  String _date = "Tgl/Bln/Thn";

  bool visible_upload = false;
  String errMessage = 'Error Uploading Image';
  Future<File> file;
  String base64Image;
  File tmpFile;
  String status = '';


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Pengaduan',
          style: TextStyle(),
        ),
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/img/logokm.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                Text(
                  'Form Pengaduan',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockVertical * 4,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  child: TextFieldContainer(
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.book,
                            color: abuAbu,
                          ),
                          hintText: "Judul",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: abuAbu)),
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  child: TextFieldContainer(
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.map,
                            color: abuAbu,
                          ),
                          hintText: "Lokasi Kejadian",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: abuAbu)),
                    ),
                  ),
                ),
                Container(
                  child: new ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 20.0, top: 00.0),
                      child: new RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                              ),
                              showTitleActions: true,
                              minTime: DateTime(2000, 1, 1),
                              maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                            _date = '${date.day}/${date.month}/${date.year}';
                            setState(() {});
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          size: 18.0,
                                          color: Colors.red[700],
                                        ),
                                        Text(
                                          " $_date",
                                          style: TextStyle(
                                              color: Colors.red[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "  Change",
                                style: TextStyle(
                                    color: Colors.red[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                showImage(),
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0.0,
                  color: Colors.grey.shade300,
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 00.0, top: 00.0),
                      child: new RaisedButton(
                        child: Text('Select Image'),
                        color: greenColors,
                        textColor: Colors.white,
                        onPressed: () {
                          chooseImage();
                        },
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: visible_upload,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0.0,
                    color: Colors.grey.shade300,
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 00.0, top: 00.0),
                        child: new RaisedButton(
                          child: Text('Upload Image'),
                          color: greenColors,
                          textColor: Colors.white,
                          onPressed: () {
                            startUpload();
                          },
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
            visible_upload = true;
          }));
          return Image.file(
            snapshot.data,
            fit: BoxFit.fill,
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            '',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }
}
