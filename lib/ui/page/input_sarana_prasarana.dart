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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        floatingActionButton:
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton.extended(
            onPressed: () {},
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
                    SizedBox(height: SizeConfig.screenHight / 18,),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Form Input Data Sarana \n Prasarana',
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
                        'Ketua Pelaksana BPDB Prov, Aceh, Kab Aceh Singkil',
                        style: TextStyle(
                            color: abuAbu, fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text('Atung Nugroho',
                        style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text('Alamat Kantor',
                        style: TextStyle(color: abuAbu, fontSize: 12),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                      child: Text('Jl. Putri Tunggal No 98',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
