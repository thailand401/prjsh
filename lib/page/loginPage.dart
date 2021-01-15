import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjsh/config/configuration.dart';
import 'package:prjsh/page/signupPage.dart';
//import 'package:prjsh/home_bottom_tab.dart';
import 'package:prjsh/components/entryField.dart';
import 'package:prjsh/components/commonWidget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Config _cf = Config();

  Widget _backButton(BuildContext context) {
    return Common.cmback(context);
  }

  Widget _facebookButton() {
    List<ExtraChild> children = [
      ExtraChild(
          child: Text('f',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400)),
          color: Colors.blue,
          size: 1),
      ExtraChild(
          child: Text('Log in with Facebook',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
          color: Colors.blue[400],
          size: 5),
    ];

    return Common.cmexbutton(children, 1);
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(
                  color: _cf.primaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainHeader() {
    return new ClipPath(
      clipper: MyClipper(),
      child: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('assets/resource/art.png'),
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
                      image: AssetImage('assets/resource/icon_owl.png'),
                      width: 50,
                    ),
                    radius: 50.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formWidget1() {
    return Column(
      children: <Widget>[
        EntryField.create("Phone Number"),
        EntryField.create("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
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
                colors: [_cf.primaryBg1, _cf.primaryBg2])),
        child: Stack(
          children: <Widget>[
            new ClipPath(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage(_cf.primaryBgimg),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AvatarGlow(
                        endRadius: 90,
                        duration: Duration(seconds: 2),
                        glowColor: _cf.primaryShadow,
                        repeat: true,
                        repeatPauseDuration: Duration(seconds: 2),
                        startDelay: Duration(seconds: 1),
                        child: Material(
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              child: Image(
                                image: AssetImage(_cf.primaryLogo),
                                width: 50,
                              ),
                              radius: 50.0,
                            )),
                      ),
                      SizedBox(height: 50),
                      _formWidget1(),
                      SizedBox(height: 20),
                      InkWell(
                          onTap: onSubmit,
                          child: Common.cmbutton('Submit', 0, context)),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password ?',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                      Common.cmdivider(),
                      _facebookButton(),
                      SizedBox(height: height * .055),
                      _createAccountLabel(),
                    ],
                  ),
                ),
              ),
            ),
            //Positioned(top: 40, left: 0, child: _backButton(context)),
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    print('submit touch');
  }
}
