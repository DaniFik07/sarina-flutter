import 'package:flutter/material.dart';
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
  List<NamaBangunan> listNamaBangunan = [];
  int namaBangunan;

  List<KondisiBangunan> listKondisiBangunan = [];
  int kondisiBangunan;

  List<SumberBangunan> listSumberBangunan = [];
  int sumberBangunan;

  List<TahunPerolehan> listTahunPerolehan = [];
  int tahunPerolehan;

  List<NamaKendaraan> listNamaKendaraan = [];
  int namaKendaraan;

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
        : setState(() => complete = true);
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
        type: _stepperType,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchStepType,
        backgroundColor: blueColors,
        child: Icon(
          Icons.swap_horizontal_circle,
          color: Colors.white,
        ),
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
                underline: SizedBox(),
                hint: Text("Pilih"),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: listTahunPerolehan.map((item) {
                  return DropdownMenuItem(
                      child: Text(item.name), value: item.id);
                }).toList(),
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

  void addDropdown() {
    setState(() {
      listNamaBangunan.add(new NamaBangunan(
        id: 1,
        name: "tes 1",
      ));
      listNamaBangunan.add(new NamaBangunan(
        id: 2,
        name: "tes 2",
      ));
      listNamaBangunan.add(new NamaBangunan(
        id: 3,
        name: "tes 3",
      ));
      listKondisiBangunan.add(new KondisiBangunan(
        id: 1,
        name: "tes 1",
      ));
      listKondisiBangunan.add(new KondisiBangunan(
        id: 2,
        name: "tes 2",
      ));
      listKondisiBangunan.add(new KondisiBangunan(
        id: 3,
        name: "tes 3",
      ));
      listSumberBangunan.add(new SumberBangunan(
        id: 1,
        name: "tes 1",
      ));
      listSumberBangunan.add(new SumberBangunan(
        id: 2,
        name: "tes 2",
      ));
      listSumberBangunan.add(new SumberBangunan(
        id: 3,
        name: "tes 3",
      ));
      listTahunPerolehan.add(new TahunPerolehan(
        id: 1,
        name: "tes 1",
      ));
      listTahunPerolehan.add(new TahunPerolehan(
        id: 2,
        name: "tes 2",
      ));
      listTahunPerolehan.add(new TahunPerolehan(
        id: 3,
        name: "tes 3",
      ));
      listNamaKendaraan.add(new NamaKendaraan(
        id: 1,
        name: "tes 1",
      ));
      listNamaKendaraan.add(new NamaKendaraan(
        id: 2,
        name: "tes 2",
      ));
      listNamaKendaraan.add(new NamaKendaraan(
        id: 3,
        name: "tes 3",
      ));
      listKondisiKendaraan.add(new KondisiKendaraan(
        id: 1,
        name: "tes 1",
      ));
      listKondisiKendaraan.add(new KondisiKendaraan(
        id: 2,
        name: "tes 2",
      ));
      listKondisiKendaraan.add(new KondisiKendaraan(
        id: 3,
        name: "tes 3",
      ));
      listSumberKendaraan.add(new SumberKendaraan(
        id: 1,
        name: "tes 1",
      ));
      listSumberKendaraan.add(new SumberKendaraan(
        id: 2,
        name: "tes 2",
      ));
      listSumberKendaraan.add(new SumberKendaraan(
        id: 3,
        name: "tes 3",
      ));
      listJenisAlat.add(new JenisAlat(
        id: 1,
        name: "tes 1",
      ));
      listJenisAlat.add(new JenisAlat(
        id: 2,
        name: "tes 2",
      ));
      listJenisAlat.add(new JenisAlat(
        id: 3,
        name: "tes 3",
      ));
      listKondisiAlat.add(new KondisiAlat(
        id: 1,
        name: "tes 1",
      ));
      listKondisiAlat.add(new KondisiAlat(
        id: 2,
        name: "tes 2",
      ));
      listKondisiAlat.add(new KondisiAlat(
        id: 3,
        name: "tes 3",
      ));
      listSumberAlat.add(new SumberAlat(
        id: 1,
        name: "tes 1",
      ));
      listSumberAlat.add(new SumberAlat(
        id: 2,
        name: "tes 2",
      ));
      listSumberAlat.add(new SumberAlat(
        id: 3,
        name: "tes 3",
      ));
    });
  }
}
