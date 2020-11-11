import 'package:flutter/material.dart';
import 'file:///C:/Users/baay4/AndroidStudioProjects/login-signup/lib/utils/constants.dart';
import 'package:sarina/utils/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: blueSecondColors,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
