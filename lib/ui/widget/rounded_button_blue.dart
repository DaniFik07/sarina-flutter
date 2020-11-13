import 'package:flutter/material.dart';
import 'package:sarina/utils/constants.dart';

class RoundedButtonBlue extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButtonBlue({
    Key key,
    this.text,
    this.press,
    this.color = blueColors,
    this.textColor = Colors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor,  fontWeight: FontWeight.w900, fontFamily: "fonts/Montserrat-Regular.ttf", fontSize: 16),
          ),
        ),
      ),
    );
  }
}
