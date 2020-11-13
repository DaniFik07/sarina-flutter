import 'package:flutter/material.dart';
import 'package:sarina/utils/constants.dart';

class TextFieldContainerWhite extends StatelessWidget {
  final Widget child;
  const TextFieldContainerWhite({
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
        color: abuMuda,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
