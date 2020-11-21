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
      Step(title: Text('Name'),
          content: Column(
            children: [
              TextField(),
            ],
          ),
        isActive: _currentStep >= 0,
        state: StepState.indexed
      ),
      Step(title: Text('No'),
        content: Column(
          children: [
            TextField(),
          ],
        ),
        isActive: _currentStep >= 1,
        state: StepState.disabled
      ),
      Step(title: Text('Name'),
        content: Column(
          children: [
            TextField(),
          ],
        ),
          isActive: _currentStep >= 2,
          state: StepState.disabled
      ),
    ];
    return _steps;
  }

}

  // String namaKendaraan = "-- Pilih --";
  //
  // StepperType stepperType = StepperType.horizontal;
  //
  // int currentStep = 0;
  // bool complete = false;
  //
  // next() {
  //   currentStep + 1 != steps.length
  //       ? goTo(currentStep + 1)
  //       : setState(() => complete = true);
  // }
  //
  // cancel() {
  //   if (currentStep > 0) {
  //     goTo(currentStep - 1);
  //   }
  // }
  //
  // goTo(int step) {
  //   setState(() => currentStep = step);
  // }
  //
  // switchStepType(){
  //   setState(() => stepperType == StepperType.horizontal ?
  //   stepperType = StepperType.vertical :
  //   stepperType = StepperType.horizontal);
  // }
// }


  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //       appBar: AppBar(
  //         title: Text('Create an account'),
  //       ),
  //       body: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text('Ketua Pelaksana BPDB Prov, Aceh, Kab Aceh Singkil', style: TextStyle(
  //                   color: abuAbu),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 12.0, top: 8.0),
  //               child: Text(
  //                 'Atung Nugroho',
  //                 style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 24,
  //                     fontWeight: FontWeight.normal),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 12.0, top: 8.0),
  //               child: Text(
  //                 'Alamat Kantor',
  //                 style: TextStyle(color: abuAbu),
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 12.0, top: 8.0),
  //               child: Text(
  //                 'Jl. Putri Tunggal No 98',
  //                 style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 24,
  //                     fontWeight: FontWeight.normal),
  //               ),
  //             ),
  //
  //             complete ? Expanded(
  //               child: Center(
  //                 child: AlertDialog(
  //                   title: new Text("Profile Created"),
  //                   content: new Text(
  //                     "Tada!",
  //                   ),
  //                   actions: <Widget>[
  //                     new FlatButton(
  //                       child: new Text("Close"),
  //                       onPressed: () {
  //                         setState(() => complete = false);
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             )
  //                 :Expanded(
  //               child: Stepper(
  //                 steps: steps,
  //                 currentStep: currentStep,
  //                 onStepContinue: next,
  //                 onStepTapped: (step) => goTo(step),
  //                 onStepCancel: cancel,
  //               ),
  //             ),
  //           ]
  //       )
  //   );
  // }
// }