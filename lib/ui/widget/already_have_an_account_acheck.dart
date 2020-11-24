import 'package:flutter/material.dart';
import 'package:sarina/utils/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Tidak Punya Akun  ? " : "Sudah Punya Akun ? ",
          style: TextStyle(color: kPrimaryLightColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: biruTua,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
