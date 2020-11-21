import 'package:flutter/material.dart';
import 'package:sarina/utils/constants.dart';
import 'package:sarina/utils/size_config.dart';

/**
 * Created by Bayu Nugroho
 * Copyright (c) 2020 . All rights reserved.
 */

class InputSaranaPrasaranaPage extends StatefulWidget {
  @override
  _InputSaranaPrasaranaPageState createState() => _InputSaranaPrasaranaPageState();

}

class Test{
  final int id;
  final String name;

  Test(this.id, this.name);

  static List<Test> getTest(){
    return <Test>[
      Test(1, 'tes'),
      Test(2, 'tes1'),
      Test(3, 'tes2'),
      Test(4, 'tes3'),
    ];
  }
}

Test _selectedTest;

// class KondisiBangunan{
//   final int id;
//   final String name;
//
//   KondisiBangunan(this.id, this.name);
//
//   static List<KondisiBangunan> getKondisiBangunan(){
//     return <KondisiBangunan>[
//       KondisiBangunan(1, 'Honda'),
//       KondisiBangunan(2, 'Kawasaki'),
//       KondisiBangunan(3, 'Yamaha'),
//       KondisiBangunan(4, 'Suzuki'),
//     ];
//   }
// }
//
// KondisiBangunan _selectedKondisiBangunan;
//
// class Sumber1{
//   final int id;
//   final String name;
//
//   Sumber1(this.id, this.name);
//
//   static List<Sumber1> getSumber1(){
//     return<Sumber1>[
//       Sumber1(1, 'sumber'),
//       Sumber1(2, 'sumber')
//     ];
//   }
// }
//
// Sumber1 _selectedSumber1;
//
// class TahunPerolehan{
//   final int id;
//   final String name;
//
//   TahunPerolehan(this.id, this.name);
//
//   static List<TahunPerolehan> getTahunPerolehan(){
//     return<TahunPerolehan>[
//       TahunPerolehan(1, '2020'),
//       TahunPerolehan(2, '2019')
//     ];
//   }
// }
//
// TahunPerolehan _selectedTahunPerolehan;
//
// class Kendaraan{
//   final int id;
//   final String name;
//
//   Kendaraan(this.id, this.name);
//
//   static List<Kendaraan> getKendaraan(){
//     return <Kendaraan>[
//       Kendaraan(1, 'Honda'),
//       Kendaraan(2, 'Kawasaki'),
//       Kendaraan(3, 'Yamaha'),
//       Kendaraan(4, 'Suzuki'),
//     ];
//   }
// }
//
// Kendaraan _selectedKendaraan;
//
// class KondisiKendaraan{
//   final int id;
//   final String name;
//
//   KondisiKendaraan(this.id, this.name);
//
//   static List<KondisiKendaraan> getKondisiKendaraan(){
//     return <KondisiKendaraan>[
//       KondisiKendaraan(1, 'Rusak'),
//       KondisiKendaraan(2, 'Tidak Rusak')
//     ];
//   }
// }
//
// KondisiKendaraan _selectedKondisiKendaraan;
//
// class Sumber{
//   final int id;
//   final String name;
//
//   Sumber(this.id, this.name);
//
//   static List<Sumber> getSumber(){
//     return<Sumber>[
//       Sumber(1, 'sumber'),
//       Sumber(2, 'sumber')
//     ];
//   }
// }
//
// Sumber _selectedSumber;

class _InputSaranaPrasaranaPageState extends State<InputSaranaPrasaranaPage> {

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

  switchStepType(){
    setState(() => _stepperType == StepperType.vertical
        ? _stepperType = StepperType.horizontal
        : _stepperType = StepperType.vertical);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('mencoba'),
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
      floatingActionButton:
      FloatingActionButton(
        onPressed: switchStepType,
        backgroundColor: blueColors,
        child: Icon(Icons.swap_horizontal_circle, color: Colors.white,),),
    );
  }

  List<Step> _stepper(){
    List<Step> _steps = [
      Step(title: Text('Fasilitas \n Penunjang',
        style: TextStyle(
            fontSize: 14,
            color: Colors.black),),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Test',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black),),
              TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text('--Pilih--'),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: Test.getTest().map((Test test){
                  return DropdownMenuItem<Test>(
                    value: test,
                    child: Text(test.name),
                  );
                }).toList(),
                onChanged: (Test val){
                  setState(() {
                    _selectedTest = val;
                  });
                },
                // val: _selectedTest
              ),
              SizedBox(height: 10,),
              Text('Kondisi Bangunan',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black),),
              TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text('--Pilih--'),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: Test.getTest().map((Test test){
                  return DropdownMenuItem<Test>(
                    value: test,
                    child: Text(test.name),
                  );
                }).toList(),
                onChanged: (Test val){
                  setState(() {
                    _selectedTest = val;
                  });
                },
                // val: _selectedTest
              ),
              SizedBox(height: 10,),
              Text('Sumber',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black),),
              TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text('--Pilih--'),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: Test.getTest().map((Test test){
                  return DropdownMenuItem<Test>(
                    value: test,
                    child: Text(test.name),
                  );
                }).toList(),
                onChanged: (Test val){
                  setState(() {
                    _selectedTest = val;
                  });
                },
                // val: _selectedTest
              ),
              SizedBox(height: 10,),
              Text('Tahun Perolehan',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black),),
              TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
              DropdownButton(
                elevation: 5,
                underline: SizedBox(),
                hint: Text('--Pilih--'),
                dropdownColor: Colors.grey[200],
                isExpanded: true,
                items: Test.getTest().map((Test test){
                  return DropdownMenuItem<Test>(
                    value: test,
                    child: Text(test.name),
                  );
                }).toList(),
                onChanged: (Test val){
                  setState(() {
                    _selectedTest = val;
                  });
                },
                // val: _selectedTest
              ),
              SizedBox(height: 10,),
              Text('Keterangan',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black),),
              SizedBox(height: 10,),
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
        state: StepState.indexed
      ),
      Step(title: Text('Unit \n Kendaraan',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black),),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nama Kendaraan',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
            DropdownButton(
              elevation: 5,
              underline: SizedBox(),
              hint: Text('--Pilih--'),
              dropdownColor: Colors.grey[200],
              isExpanded: true,
              items: Test.getTest().map((Test test){
                return DropdownMenuItem<Test>(
                  value: test,
                  child: Text(test.name),
                );
              }).toList(),
              onChanged: (Test val){
                setState(() {
                  _selectedTest = val;
                });
              },
              // val: _selectedTest
            ),
            SizedBox(height: 10,),
            Text('Kondisi Kendaraan',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
            DropdownButton(
              elevation: 5,
              underline: SizedBox(),
              hint: Text('--Pilih--'),
              dropdownColor: Colors.grey[200],
              isExpanded: true,
              items: Test.getTest().map((Test test){
                return DropdownMenuItem<Test>(
                  value: test,
                  child: Text(test.name),
                );
              }).toList(),
              onChanged: (Test val){
                setState(() {
                  _selectedTest = val;
                });
              },
              // val: _selectedTest
            ),
            SizedBox(height: 10,),
            Text('Sumber',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
            DropdownButton(
              elevation: 5,
              underline: SizedBox(),
              hint: Text('--Pilih--'),
              dropdownColor: Colors.grey[200],
              isExpanded: true,
              items: Test.getTest().map((Test test){
                return DropdownMenuItem<Test>(
                  value: test,
                  child: Text(test.name),
                );
              }).toList(),
              onChanged: (Test val){
                setState(() {
                  _selectedTest = val;
                });
              },
              // val: _selectedTest
            ),
            SizedBox(height: 10,),
            Text('Jumlah',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "Masukkan jumlah unit",
                  hintStyle: TextStyle(fontSize: 14, color: abuAbu)
              ),
            ),
            SizedBox(height: 10,),
            Text('Keterangan',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            SizedBox(height: 10,),
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
        state: StepState.disabled
      ),
      Step(title: Text('Lainnya',
        style: TextStyle(
            fontSize: 14,
            color: Colors.black),),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Jenis Alat',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
            DropdownButton(
              elevation: 5,
              underline: SizedBox(),
              hint: Text('--Pilih--'),
              dropdownColor: Colors.grey[200],
              isExpanded: true,
              items: Test.getTest().map((Test test){
                return DropdownMenuItem<Test>(
                  value: test,
                  child: Text(test.name),
                );
              }).toList(),
              onChanged: (Test val){
                setState(() {
                  _selectedTest = val;
                });
              },
              // val: _selectedTest
            ),
            SizedBox(height: 10,),
            Text('Kondisi Alat',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
            DropdownButton(
              elevation: 5,
              underline: SizedBox(),
              hint: Text('--Pilih--'),
              dropdownColor: Colors.grey[200],
              isExpanded: true,
              items: Test.getTest().map((Test test){
                return DropdownMenuItem<Test>(
                  value: test,
                  child: Text(test.name),
                );
              }).toList(),
              onChanged: (Test val){
                setState(() {
                  _selectedTest = val;
                });
              },
              // val: _selectedTest
            ),
            SizedBox(height: 10,),
            Text('Sumber',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            TextField(), //caranya minggirin gimana? kalau ngga da ini pada ditengah tulisannya
            DropdownButton(
              elevation: 5,
              underline: SizedBox(),
              hint: Text('--Pilih--'),
              dropdownColor: Colors.grey[200],
              isExpanded: true,
              items: Test.getTest().map((Test test){
                return DropdownMenuItem<Test>(
                  value: test,
                  child: Text(test.name),
                );
              }).toList(),
              onChanged: (Test val){
                setState(() {
                  _selectedTest = val;
                });
              },
              // val: _selectedTest
            ),
            SizedBox(height: 10,),
            Text('Jumlah',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "Masukkan jumlah unit",
                  hintStyle: TextStyle(fontSize: 14, color: abuAbu)
              ),
            ),
            SizedBox(height: 10,),
            Text('Keterangan',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black),),
            SizedBox(height: 10,),
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
          state: StepState.disabled
      ),
    ];
    return _steps;
  }
}