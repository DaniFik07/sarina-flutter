import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:sarina/data/network/responses/get_sumber.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/models/dropdown_model.dart';
import 'package:sarina/ui/page/home_page.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';
import 'package:sarina/utils/util_widget.dart';
import 'package:select_dialog/select_dialog.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class FormInputKegiatan extends StatefulWidget {
  String title = "";

  FormInputKegiatan({this.title});

  @override
  _FormInputKegiatanState createState() => _FormInputKegiatanState();
}

class _FormInputKegiatanState extends State<FormInputKegiatan> {
  String jenisAnggaran = "-- Pilih --";
  final storage = new FlutterSecureStorage();
  List<Datum> listExample = [];
  int clan;
  TextEditingController sumberController = TextEditingController(text: "");
  String sumberId = "";
  String _setTimeFrom, _setTimeTo, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController namaKegiatanController = TextEditingController();
  TextEditingController prosesKegiatanController = TextEditingController();
  TextEditingController deskKegiatanController = TextEditingController();
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTimeFrom(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _fromController.text = _time;
        _fromController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  Future<Null> _selectTimeTo(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _toController.text = _time;
        _toController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    addDataDropdown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _sumberDana = Container(
      child: new ListTile(
        leading: const Icon(Icons.my_location),
        title: Padding(
          padding: EdgeInsets.only(bottom: 10.0, top: 00.0),
          child: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              SelectDialog.showModal<Datum>(
                context,
                label: "Sumber Dana",
                items: listExample,
                onFind: (String filter) => _fetchFilerDana(filter),
                itemBuilder:
                    (BuildContext context, Datum item, bool isSelected) {
                  return Container(
                    child: ListTile(
                      selected: isSelected,
                      title: Text(item.sumberdanaName),
                    ),
                  );
                },
                onChange: (Datum result) {
                  setState(() {
                    sumberController.text = result.sumberdanaName;
                    sumberId = result.id.toString();
                  });
                },
              );
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: sumberController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Sumber Dana',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi Provinsi';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ),
    );

    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          elevation: 3,
          onPressed: () {
            doSubmit();
          },
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHight / 7,
                    color: blueColors,
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.screenHight / 18),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Form Input Kegiatan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHight / 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: SizeConfig.screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.camera,
                                  color: Colors.black,
                                ),
                                hintText: "Jenis Kegiatan : ${widget.title}",
                                hintStyle:
                                    TextStyle(fontSize: 16, color: abuAbu)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: namaKegiatanController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.book,
                            color: Colors.black,
                          ),
                          hintText: "Nama Kegiatan",
                          hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    child: Text(
                      'Sumber Anggaran',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                  ),
                  _sumberDana,
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: prosesKegiatanController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.timelapse,
                            color: Colors.black,
                          ),
                          hintText: "Progress Kegiatan",
                          hintStyle: TextStyle(fontSize: 16, color: abuAbu)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    child: Text(
                      'Tanggal Kegiatan',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Center(
                      child: Container(
                        width: SizeConfig.screenWidth / 1.7,
                        // height: _height / 9,
                        margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: TextFormField(
                          style:
                              TextStyle(fontSize: SizeConfig.blockVertical * 3),
                          textAlign: TextAlign.center,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _dateController,
                          onSaved: (String val) {
                            _setDate = val;
                          },
                          decoration: InputDecoration(
                              disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              // labelText: 'Time',
                              contentPadding: EdgeInsets.only(top: 0.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    child: Text(
                      'Waktu Kegiatan',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            _selectTimeFrom(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            width: SizeConfig.screenWidth / 3,
                            // height: SizeConfig.screenWidth / 9,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: SizeConfig.blockVertical * 3),
                              textAlign: TextAlign.center,
                              onSaved: (String val) {
                                _setTimeFrom = val;
                              },
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _fromController,
                              decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  // labelText: 'Time',
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Sampai'),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            _selectTimeTo(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            width: SizeConfig.screenWidth / 3,
                            // height: SizeConfig.screenWidth / 9,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: SizeConfig.blockVertical * 3),
                              textAlign: TextAlign.center,
                              onSaved: (String val) {
                                _setTimeTo = val;
                              },
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _toController,
                              decoration: InputDecoration(
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  // labelText: 'Time',
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                    child: Text(
                      'Deskripsi Kegiatan',
                      style: TextStyle(color: abuAbu),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: deskKegiatanController,
                      minLines: 10,
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
                    height: 100,
                  )
                ],
              ),
            ),
            Positioned(
              top: 36,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Icon(
                          Icons.arrow_back,
                          color: blueColors,
                          size: 30,
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addDataDropdown() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    ServiceApiConfig().getSumber(token).then((val) {
      setState(() {
        listExample = val.data;
      });
    }).catchError((_) {});
  }

  Future<List<Datum>> _fetchFilerDana(String filter) async {
    List<Datum> list = new List();
    for (var city in listExample) {
      if (city.sumberdanaName.toLowerCase().contains(filter.toLowerCase())) {
        list.add(city);
      }
    }
    return list;
  }

  void doSubmit() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    String id_user = await storage.read(key: ID_USER);
    print( id_user+ "\n "+
        sumberId+ "\n "+
        widget.title+ "\n "+
        namaKegiatanController.text+ "\n "+
        prosesKegiatanController.text+ "\n "+
        _dateController.text+ "\n "+
        _fromController.text + " - " + _toController.text+ "\n "+
        deskKegiatanController.text);
    ServiceApiConfig()
        .postKegiatan(
            id_user,
            sumberId,
            widget.title,
            namaKegiatanController.text,
            prosesKegiatanController.text,
            _dateController.text,
            _fromController.text + " - " + _toController.text,
            deskKegiatanController.text,token)
        .then((val) {
      if (val.msg == "Form Submitted") {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        showToast(context, "${val.msg}");
      } else {
        showToast(context, "${val.msg}");
      }
    }).catchError((onError) {
      showToast(context, "${onError}");
    });
  }
}
