import 'package:flutter/material.dart';

//Color(0xffdf8e33).withAlpha(100) 8938aa 1f0327
class Config {
  static Color mainColor = Colors.black;
  static Color primaryBg1 = Color(0xff310045);
  static Color primaryBg2 = Color(0xff14001c);
  static Color primaryBt1 = Color(0xff8d3aaf);
  static Color primaryBt2 = Color(0xff662182);
  static Color primaryText = Color(0xfffbf1ff);
  static Color submaryText = Color(0xffdbd2df);
  static Color primaryIcon = Color(0xff8d3aaf);
  static Color submaryBorder = Color(0xff8d3aaf);
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
