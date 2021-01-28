import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

import 'package:image/image.dart' as Img;
import 'dart:math' as Math;
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sarina/ui/page/home_page.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';
import 'package:sarina/utils/util_widget.dart';

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
  String jenis_bencana = "-- Pilih --";
  bool visible_upload = false;
  File _image;
  String token = "";
  String id_user = "";
  final storage = new FlutterSecureStorage();
  TextEditingController judulController = new TextEditingController();
  TextEditingController deskController = new TextEditingController();

  @override
  void initState() {
    getDataLogin();
    _determinePosition();
    super.initState();
  }

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
                  width: SizeConfig.screenWidth / 1.2,
                  child: DropdownButton(
                    elevation: 5,
                    hint: Text('------'),
                    dropdownColor: Colors.grey[200],
                    isExpanded: true,
                    items: [
                      DropdownMenuItem<String>(
                        value: "-- Pilih --",
                        child: Text(
                          "-- Pilih --",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "Bencana Alam",
                        child: Text(
                          "Bencana Alam",
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: "Bencana Non Alam",
                        child: Text(
                          "Bencana Non Alam",
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        jenis_bencana = value;
                      });
                    },
                    value: jenis_bencana,
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  child: TextFieldContainer(
                    child: TextField(
                      controller: judulController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.book,
                            color: abuAbu,
                          ),
                          hintText: "Judul",
                          hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.screenWidth,
                  child: TextFieldContainer(
                    child: TextField(
                      controller: deskController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.map,
                            color: abuAbu,
                          ),
                          hintText: "Deskripsi",
                          hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
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
                              maxTime: DateTime(2022, 12, 31),
                              onConfirm: (date) {
                            _date = '${date.day}/${date.month}/${date.year}';
                            setState(() {});
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
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
                _image == null
                    ? new Text("No image selected!")
                    : Column(
                        children: [
                          Card(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Image.file(
                                  _image,
                                  width: 200,
                                  height: 200,
                                ),
                              )),
                        ],
                      ),
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
                        child: Text(
                            _image == null ? "Select Image" : "Change Image"),
                        color: greenColors,
                        textColor: Colors.white,
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Upload Gambar',
                            desc: '',
                            btnCancelText: 'Via Gallery',
                            btnOkText: 'Cancel',
                            btnCancelOnPress: () {
                              getImageGallery();
                            },
                            btnOkOnPress: () {
                            },
                          )..show();
                        },
                      ),
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0.0,
                  color: Colors.grey.shade300,
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 00.0, top: 00.0),
                      child: new RaisedButton(
                        child: Text('Submit'),
                        color: greenColors,
                        textColor: Colors.white,
                        onPressed: () async {
                          Position position =
                              await Geolocator.getCurrentPosition(
                                  desiredAccuracy: LocationAccuracy.high);
                          if (_image == null) {
                            showToast(context,
                                "silahkan upload gambar terlebih dahulu");
                          } else {
                            if (position.latitude != null ||
                                position.latitude.toString().length > 2) {
                              upload(_image, context, token, position.latitude,
                                  position.longitude);
                            } else {
                              _determinePosition();
                              showToast(context,
                                  "aktifkan permission lokasi terlebih dahulu");
                            }
                          }
                          // startUpload();
                        },
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

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(100000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, height: 500, width: 500);

    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }


  void getDataLogin() async {
    token = await storage.read(key: TOKEN_LOGIN);
    id_user = await storage.read(key: ID_USER);
    setState(() {});
  }

  Future upload(File imageFile, BuildContext context, String token,
      double latitude, double longitude) async {
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("$SUBMIT_PENGADUAN");
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    var multipartFile = new http.MultipartFile("photo", stream, length,
        filename: basename(imageFile.path));
    request.fields['ID_USER'] = "$id_user";
    request.fields['JUDUL'] = "${judulController.text}";
    request.fields['LAT'] = "$latitude";
    request.fields['LNG'] = "$longitude";
    request.fields['TANGGAL'] = "$_date";
    request.fields['DESKRIPSI'] = "${deskController.text}";
    request.files.add(multipartFile);
    var response = await request.send();

    if (response.statusCode == 200) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      showToast(context, "Data Uploaded");
    } else {
      showToast(context, "Upload Failed");
    }
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
}
