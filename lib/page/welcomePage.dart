import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjsh/config/configuration.dart';
import 'package:prjsh/components/delayedAnimation.dart';
import 'package:prjsh/page/loginPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Config.primaryText;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Config.primaryBg1, Config.primaryBg2])),
          child: Center(
            child: Column(
              children: <Widget>[
                new ClipPath(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage('assets/resource/bloom.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                    child: Column(
                      children: <Widget>[
                        AvatarGlow(
                          endRadius: 90,
                          duration: Duration(seconds: 2),
                          glowColor: Colors.white24,
                          repeat: true,
                          repeatPauseDuration: Duration(seconds: 2),
                          startDelay: Duration(seconds: 1),
                          child: Material(
                              elevation: 8.0,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[100],
                                child: Image(
                                  image: AssetImage(
                                      'assets/resource/icon_owl.png'),
                                  width: 50,
                                ),
                                radius: 50.0,
                              )),
                        ),
                        DelayedAnimation(
                          child: Text(
                            "Hi There",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: color),
                          ),
                          delay: delayedAmount + 1000,
                        ),
                        DelayedAnimation(
                          child: Text(
                            "I'm Reflectly",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0,
                                color: color),
                          ),
                          delay: delayedAmount + 2000,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        DelayedAnimation(
                          child: Text(
                            "Your New Personal",
                            style: TextStyle(fontSize: 20.0, color: color),
                          ),
                          delay: delayedAmount + 3000,
                        ),
                        DelayedAnimation(
                          child: Text(
                            "Journaling  companion",
                            style: TextStyle(fontSize: 20.0, color: color),
                          ),
                          delay: delayedAmount + 3500,
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        DelayedAnimation(
                          child: GestureDetector(
                            onTapDown: _onTapDown,
                            child: Transform.scale(
                              scale: _scale,
                              child: _animatedButtonUI,
                            ),
                          ),
                          delay: delayedAmount + 4000,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        DelayedAnimation(
                          child: Text(
                            "I Already have An Account".toUpperCase(),
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                          delay: delayedAmount + 5000,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Continue',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8185E2),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
