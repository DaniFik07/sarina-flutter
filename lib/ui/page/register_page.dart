

import 'package:flutter/material.dart';
import 'package:sarina/data/network/responses/response_province.dart' as prov;
import 'package:sarina/data/network/responses/response_kabupaten.dart' as City;
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/ui/widget/already_have_an_account_acheck.dart';
import 'package:sarina/ui/widget/rounded_button.dart';
import 'package:sarina/ui/widget/rounded_button_blue.dart';
import 'package:sarina/ui/widget/text_field_container.dart';
import 'package:sarina/ui/widget/text_field_container_white.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/util_widget.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:toast/toast.dart';

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

  List<prov.Datum> listProvince = List<prov.Datum>();
  List<City.Datum> listCity = List<City.Datum>();

  // List<String> list_kode_provinsi = [];
  // List<String> list_provinsi = [];
  String provinceId = "";
  String cityId = "";


  TextEditingController usernameController = new TextEditingController();
  TextEditingController fullnameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController cPasswordController = new TextEditingController();
  TextEditingController province = TextEditingController(text: "");
  TextEditingController city = TextEditingController(text: "");
  TextEditingController emailController = new TextEditingController();
  TextEditingController noController = new TextEditingController();

  @override
  void initState() {
    getDataProvince();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _provinsi = Container(
      child: new ListTile(
        leading: const Icon(Icons.my_location),
        title: Padding(
          padding: EdgeInsets.only(bottom: 10.0, top: 00.0),
          child: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              SelectDialog.showModal<prov.Datum>(
                context,
                label: "Pilih Provinsi",
                items: listProvince,
                onFind: (String filter) => _fetchFilterProvince(filter),
                itemBuilder: (BuildContext context,prov.Datum item,
                    bool isSelected) {
                  return Container(
                    child: ListTile(
                      selected: isSelected,
                      title: Text(item.provincesName),
                    ),
                  );
                },
                onChange: (prov.Datum result) {
                  setState(() {
                    city.text = "";
                    province.text = result.provincesName;
                    provinceId = result.id.toString();
                    _fetchCity(result.id.toString()).then((value) {
                      listCity.clear();
                      listCity.addAll(value);
                    });
                    // Navigator.pop(context);
                  });
                },
              );
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: province,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Provinsi',
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
    final _kota = Container(
      child: new ListTile(
        leading: const Icon(Icons.my_location),
        title: Padding(
          padding: EdgeInsets.only(bottom: 10.0, top: 00.0),
          child: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              if (province.text == "") {
                Toast.show("Harap untuk memilih provinsi dahulu", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              } else {
                SelectDialog.showModal<City.Datum>(
                  context,
                  label: "Pilih Kota",
                  items: listCity,
                  onFind: (String filter) => _fetchFilterCity(filter),
                  itemBuilder: (BuildContext context, City.Datum item,
                      bool isSelected) {
                    return Container(
                      child: ListTile(
                        selected: isSelected,
                        title: Text(item.regenciesName),
                      ),
                    );
                  },
                  onChange: (City.Datum result) {
                    setState(() {
                      city.text = result.regenciesName;
                      cityId = result.id.toString();
                    });
                  },
                );
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                controller: city,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Kota',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Harap isi Kota';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ),
    );

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
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: _provinsi,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: _kota,
                    ),
                  ),
                ),

                TextFieldContainerWhite(
                  child: TextField(
                    controller: fullnameController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      hintText: "Fullname",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldContainerWhite(
                  child: TextField(
                    controller: usernameController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      ),
                      hintText: "Username",
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
                    doRegister(fullnameController.text,usernameController.text,passwordController.text,cPasswordController.text,emailController.text,noController.text);
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

  void doRegister(String fullname,String username, String password, String cpassword, String email, String no) {
    if(username.isEmpty ||password.isEmpty ||cpassword.isEmpty ||email.isEmpty ||no.isEmpty ){
      showToast(context, "data tidak boleh kosong");
    }else if(password!=cpassword){
      showToast(context, "password harus sama");
    }else{
      ServiceApiConfig().postRegister(fullname,username, password, email, no,provinceId,cityId).then((value){
        Navigator.pop(context);
        showToast(context, "berhasil register");
      }).catchError((onError){
        showToast(context, "$onError");
      });
    }
  }

  void getDataProvince() {
    ServiceApiConfig().getProvince().then((val){
      setState(() {
        listProvince.addAll(val.data);
      });
    }).catchError((onError){

    });
  }

  Future<List<City.Datum>> _fetchCity(String id) async {
    City.ResponseKabupaten cityModel = await ServiceApiConfig().getCity(id);
    return cityModel.data;
  }


  Future<List<prov.Datum>> _fetchFilterProvince(String filter) async {
    List<prov.Datum> list = new List();
    for (var province in listProvince) {
      if (province.provincesName.toLowerCase().contains(filter.toLowerCase())) {
        list.add(province);
      }
    }
    return list;
  }

  Future<List<City.Datum>> _fetchFilterCity(String filter) async {
    List<City.Datum> list = new List();
    for (var city in listCity) {
      if (city.regenciesName.toLowerCase().contains(filter.toLowerCase())) {
        list.add(city);
      }
    }
    return list;
  }
}
