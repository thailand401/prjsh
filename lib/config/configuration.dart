import 'package:flutter/material.dart';

//Color(0xffdf8e33).withAlpha(100) 8938aa 1f0327
class Config {
  static Color mainColor = Colors.black;
  static Color mainBg1 = Color(0xffffffff);
  static Color mainBg2 = Color(0xffede7f6);
  static Color mainText = Color(0xff010101);
  static Color mainSubText = Color(0xff212121);
  static Color mainShadow = Colors.black38;

  String primaryBgimg = 'assets/resource/night_mode.png';
  String primaryLogo = 'assets/resource/icon_owl_violet.png';
  Color primaryBg1 = Color(0xff200033);
  Color primaryBg2 = Color(0xff13001f);
  Color primaryBt1 = Color(0xff8d3aaf);
  Color primaryBt2 = Color(0xff662182);
  Color primaryText = Color(0xfffbf1ff);
  Color submaryText = Color(0xffdbd2df);
  Color primaryIcon = Color(0xff8d3aaf);
  Color submaryBorder = Color(0xff8d3aaf);
  Color primaryShadow = Colors.white24;

  Config() {
    int mode = 1;
    if (mode == 1) {
      this.primaryBg1 = mainBg1;
      this.primaryBg2 = mainBg2;
      this.primaryText = mainText;
      this.submaryText = mainSubText;
      this.primaryShadow = mainShadow;
      this.primaryBgimg = 'assets/resource/light_mode.png';
      this.primaryLogo = 'assets/resource/icon_owl.png';
      print(this.submaryText);
    }
  }
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
