import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sarina/data/network/responses/get_fasilitas_p.dart';
import 'package:sarina/data/network/responses/get_kendaraan.dart';
import 'package:sarina/data/network/responses/response_get_kuesionerap.dart';
import 'package:sarina/data/network/servis_api_config.dart';
import 'package:sarina/models/dropdown_model.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class InputSaranaPrasaranaPage extends StatefulWidget {
  String title = "";
  String kab_id;
  String kab = "";
  String prov = "";
  String prov_id = "";

  InputSaranaPrasaranaPage(
      {this.title, this.kab_id, this.kab, this.prov, this.prov_id});

  @override
  _InputSaranaPrasaranaPageState createState() =>
      _InputSaranaPrasaranaPageState();
}

class _InputSaranaPrasaranaPageState extends State<InputSaranaPrasaranaPage> {
  final storage = new FlutterSecureStorage();

  List<NamaBangunan> listNamaBangunan = [];
  int namaBangunan;

  List<KondisiBangunan> listKondisiBangunan = [];
  int kondisiBangunan;

  List<SumberBangunan> listSumberBangunan = [];
  int sumberBangunan;

  String tahunPerolehan = "2020";

  List<NamaKendaraan> listNamaKendaraan = [];
  int namaKendaraan;

  List<Kepemilikan> listKepemilikan = [];
  int kepemilikan;

  List<KondisiKendaraan> listKondisiKendaraan = [];
  int kondisiKendaraan;

  List<SumberKendaraan> listSumberKendaraan = [];
  int sumberKendaraan;

  List<JenisAlat> listJenisAlat = [];
  int jenisAlat;

  List<KondisiAlat> listKondisiAlat = [];
  int kondisiAlat;

  List<SumberAlat> listSumberAlat = [];
  int sumberAlat;

  @override
  void initState() {
    addDropdown();
    super.initState();
  }

  int _currentStep = 0;
  bool complete = false;
  StepperType stepperType = StepperType.horizontal;

  next() {
    _currentStep + 1 != _stepper().length
        ? goTo(_currentStep + 1)
        : uploadData();
  }

  cancel() {
    if (_currentStep > 0) {
      goTo(_currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => _currentStep = step);
  }

  StepperType _stepperType = StepperType.vertical;

  switchStepType() {
    setState(() => _stepperType == StepperType.vertical
        ? _stepperType = StepperType.horizontal
        : _stepperType = StepperType.vertical);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Input Data Sarana Prasarana'),
      ),
      body: Stepper(
        steps: _stepper(),
        physics: ClampingScrollPhysics(),
        currentStep: this._currentStep,
        onStepTapped: (step) => goTo(step),
        onStepContinue: next,
        onStepCancel: cancel,
        type: StepperType.horizontal,
      ),
    );
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
          title: Text(
            'Fasilitas \n Penunjang',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nama Bangunan',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listNamaBangunan.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    namaBangunan = value;
                  });
                },
                value: namaBangunan,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Jenis Kepemilikan',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listKepemilikan.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    kepemilikan = value;
                  });
                },
                value: kepemilikan,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Kondisi Bangunan',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listKondisiBangunan.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    kondisiBangunan = value;
                  });
                },
                value: kondisiBangunan,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sumber',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listSumberBangunan.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    sumberBangunan = value;
                  });
                },
                value: sumberBangunan,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tahun Perolehan',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                hint: Text('------'),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
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
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "2022",
                    child: Text(
                      "2022",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "2023",
                    child: Text(
                      "2023",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "2024",
                    child: Text(
                      "2024",
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    tahunPerolehan = value;
                  });
                },
                value: tahunPerolehan,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Keterangan',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
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
            ],
          ),
          isActive: _currentStep >= 0,
          state: StepState.indexed),
      Step(
          title: Text(
            'Unit \n Kendaraan',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nama Kendaraan',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listNamaKendaraan.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    namaKendaraan = value;
                  });
                },
                value: namaKendaraan,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Kondisi Kendaraan',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listKondisiKendaraan.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    kondisiKendaraan = value;
                  });
                },
                value: kondisiKendaraan,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sumber',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listSumberKendaraan.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    sumberKendaraan = value;
                  });
                },
                value: sumberKendaraan,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Jumlah',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: "Masukkan jumlah unit",
                    hintStyle: TextStyle(fontSize: 14, color: abuAbu)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Keterangan',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
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
            ],
          ),
          isActive: _currentStep >= 1,
          state: StepState.disabled),
      Step(
          title: Text(
            'Lainnya',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Jenis Alat',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listJenisAlat.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    jenisAlat = value;
                  });
                },
                value: jenisAlat,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Kondisi Alat',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listKondisiAlat.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    kondisiAlat = value;
                  });
                },
                value: kondisiAlat,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Sumber',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listSumberAlat.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    sumberAlat = value;
                  });
                },
                value: sumberAlat,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Jumlah',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: "Masukkan jumlah unit",
                    hintStyle: TextStyle(fontSize: 14, color: abuAbu)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Keterangan',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
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
            ],
          ),
          isActive: _currentStep >= 2,
          state: StepState.disabled),
    ];
    return _steps;
  }

  void addDropdown() async {
    String token = await storage.read(key: TOKEN_LOGIN);
    await ServiceApiConfig().getFasilitasPenunjang(token).then((data) {
      addBangunan(data.data.jenisBangunan.data);
      addKepemilikan(data.data.jenisKepemilikan.data);
    }).catchError((onError) {});

    await ServiceApiConfig().getKendaraan(token).then((data) {
      addKendaraan(data.data.kendaraan.data);
    }).catchError((onError) {});

    await ServiceApiConfig().getPeralatanPendukung(token).then((data) {
      addKondisi(data.data.kondisi.data);
      addSumber(data.data.sumber.data);
      addPeralatanPendukung(data.data.peralatan.data);
    }).catchError((onError) {});
  }

  void addKondisi(List<KondisiDatum> data) {
    for (int i = 0; i < data.length; i++) {
      setState(() {
        listKondisiBangunan.add(
            new KondisiBangunan(id: data[i].id, name: data[i].conditionName));
        listKondisiAlat
            .add(new KondisiAlat(id: data[i].id, name: data[i].conditionName));
        listKondisiKendaraan.add(
            new KondisiKendaraan(id: data[i].id, name: data[i].conditionName));
      });
    }
  }

  void addSumber(List<KondisiDatum> data) {
    for (int i = 0; i < data.length; i++) {
      setState(() {
        listSumberAlat
            .add(new SumberAlat(id: data[i].id, name: data[i].sumberdanaName));
        listSumberBangunan.add(
            new SumberBangunan(id: data[i].id, name: data[i].sumberdanaName));

        listSumberKendaraan.add(
            new SumberKendaraan(id: data[i].id, name: data[i].sumberdanaName));
      });
    }
  }

  void addBangunan(List<Datum> data) {
    for (int i = 0; i < data.length; i++) {
      setState(() {
        listNamaBangunan
            .add(new NamaBangunan(id: data[i].id, name: data[i].buildingType));
      });
    }
  }

  void addKendaraan(List<KendaraanDatum> data) {
    for (int i = 0; i < data.length; i++) {
      setState(() {
        listNamaKendaraan
            .add(new NamaKendaraan(id: data[i].id, name: data[i].vehicleName));
      });
    }
  }

  void addKepemilikan(List<Datum> data) {
    for (int i = 0; i < data.length; i++) {
      setState(() {
        listKepemilikan.add(
            new Kepemilikan(id: data[i].id, name: data[i].kepemilikanType));
      });
    }
  }

  void addPeralatanPendukung(List<PeralatanDatum> data) {
    for (int i = 0; i < data.length; i++) {
      setState(() {
        listJenisAlat
            .add(new JenisAlat(id: data[i].id, name: data[i].id.toString()));
      });
    }
  }

  uploadData() async {
    print('dsadsadsadsasasdadas');
  }
}
