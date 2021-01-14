import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:prjsh/page/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjsh/config/configuration.dart';
import 'package:prjsh/components/entryField.dart';
import 'package:prjsh/components/commonWidget.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget _submitButton(BuildContext context) {
    return InkWell(
        onTap: onSubmit, child: Common.cmbutton('Submit', 0, context));
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
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

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        EntryField.create("Your Name"),
        EntryField.create("Mobile Number"),
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
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _mainHeader(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(context),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: Common.cmback(context)),
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    print('submit touch');
  }
}
