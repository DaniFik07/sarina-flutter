import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/ui/page/home_page.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';
import 'package:sarina/utils/util_widget.dart';

class InformasiBencanaPage extends StatefulWidget {
  String title;
  String kab_id;
  String kab = "";
  String prov = "";
  String prov_id = "";

  InformasiBencanaPage(
      {this.title, this.kab_id, this.kab, this.prov, this.prov_id});

  @override
  _InformasiBencanaPageState createState() => _InformasiBencanaPageState();
}

class _InformasiBencanaPageState extends State<InformasiBencanaPage> {
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  bool visible_upload = false;

  String name = "";
  String pic_id = "";
  String address = "";
  String tahun = "2020";
  String type_bencana = "1";
  String errMessage = 'Error Uploading Image';
  final storage = new FlutterSecureStorage();
  TextEditingController anginTController = new TextEditingController();
  TextEditingController kekeringanController = new TextEditingController();
  TextEditingController karhutlaController = new TextEditingController();
  TextEditingController lainnyaController = new TextEditingController();
  TextEditingController kerugianMateriController = new TextEditingController();
  TextEditingController keteranganController = new TextEditingController();
  TextEditingController gempaBumiController = new TextEditingController();
  TextEditingController tsunamiController = new TextEditingController();
  TextEditingController gunungApiController = new TextEditingController();
  bool permission = false;
  String lat = "";
  String lng = "";

  @override
  void initState() {
    getPic();
    _determinePosition().then((val) {
      setState(() {
        lat = "${val.latitude}";
        lng = "${val.longitude}";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: Visibility(
        visible: visible_upload,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton.extended(
            onPressed: () {
              doSubmit();
            },
            elevation: 3,
            backgroundColor: greenColors,
            label: Container(
              width: SizeConfig.screenWidth / 1.3,
              child: Text(
                "SUBMIT",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHight / 5,
                color: blueColors,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHight / 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Form Input Informasi Bencana',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                width: SizeConfig.screenWidth,
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        'Ketua Pelaksana BPBD Prov, ${widget.prov}, Kab ${widget.kab}',
                        style: TextStyle(color: abuAbu, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        '$name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        'Alamat Kantor',
                        style: TextStyle(color: abuAbu, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text(
                        '$address',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.date_range),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Tipe Bencana : '),
                      Container(
                        child: DropdownButton(
                          elevation: 5,
                          hint: Text('Tipe Bencana'),
                          dropdownColor: Colors.grey[200],
                          items: [
                            DropdownMenuItem<String>(
                              value: "1",
                              child: Text(
                                "Alam",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "2",
                              child: Text(
                                "Non Alam",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              type_bencana = value;
                            });
                          },
                          value: type_bencana,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.date_range),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Tahun : '),
                      Container(
                        child: DropdownButton(
                          elevation: 5,
                          hint: Text('Tahun'),
                          dropdownColor: Colors.grey[200],
                          items: [
                            DropdownMenuItem<String>(
                              value: "2020",
                              child: Text(
                                "2020",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "2021",
                              child: Text(
                                "2021",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "2022",
                              child: Text(
                                "2022",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              tahun = value;
                            });
                          },
                          value: tahun,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: gempaBumiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "Gempa Bumi",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: tsunamiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "Tsunami",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: gunungApiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "Gunung Api",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: anginTController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "Angin Topan",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  controller: kekeringanController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "Kekeringan",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  controller: karhutlaController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "KARHUTLA",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  controller: lainnyaController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      hintText: "Lainnya",
                      hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                child: Text(
                  'Kerugian Materi',
                  style: TextStyle(color: abuAbu),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  minLines: 10,
                  controller: kerugianMateriController,
                  maxLines: 15,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Deskripsikan di sini..',
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                child: Text(
                  'Keterangan',
                  style: TextStyle(color: abuAbu),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  minLines: 10,
                  maxLines: 15,
                  controller: keteranganController,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Deskripsikan di sini..',
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
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
              showImage(),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  void getPic() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    String id_pic = await storage.read(key: ID_PIC);
    ServiceApiConfig().getPicById(id_pic, token).then((val) {
      if (val.data.length > 0) {
        setState(() {
          name = val.data[0].fullname;
          pic_id = val.data[0].picId.toString();
          address = val.data[0].alamat;
        });
      }
    }).catchError((_) {});
  }

  void doSubmit() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    String id_user = await storage.read(key: ID_USER);
    var now = DateTime.now();
    String mydate = DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // LocationPermission permission = await Geolocator.checkPermission();
    // if(permission.index)
    //   LocationPermission permission = await Geolocator.requestPermission();

    if (position.latitude != null || position.latitude.toString().length > 2) {
      ServiceApiConfig()
          .submitBencana(
              token,
              widget.prov_id,
              widget.kab_id,
              id_user,
              pic_id,
              gempaBumiController.text,
              tsunamiController.text,
              gunungApiController.text,
              anginTController.text,
              kekeringanController.text,
              karhutlaController.text,
              lainnyaController.text,
              kerugianMateriController.text,
              keteranganController.text,
              mydate,
              tahun,
              position.latitude.toString(),
              position.longitude.toString())
          .then((val) {
        if (val.msg == "Form Submitted") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        } else {
          showToast(context, "${val.msg}");
        }
      }).catchError((onError) {});
    } else {
      showToast(context, "aktifkan permission lokasi terlebih dahulu");
    }
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

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    print(fileName + ' nama file');

    // ServiceApiConfig().postBanner(base64Image,urlController.text.toString()).then((val){
    //   if(val.message == "Data Inserted Successfully"){
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (BuildContext context) => HomePageNew()));
    //   }else{
    //     showToast(context, val.message.toString());
    //   }
    // }).catchError((onError){
    //   showToast(context, '$onError');
    // });
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
}
