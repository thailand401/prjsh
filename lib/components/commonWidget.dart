import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prjsh/config/configuration.dart';

class Common {
  static Widget cmdivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Config.primaryText,
                thickness: 1,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(color: Config.primaryText),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Config.primaryText,
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  static Widget cmbutton(String _title, int _shadow, BuildContext context) {
    List<BoxShadow> shadowValue = [];
    if (_shadow == 1) {
      shadowValue.add(BoxShadow(
          color: Colors.grey.shade200,
          offset: Offset(2, 4),
          blurRadius: 5,
          spreadRadius: 2));
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: shadowValue,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Config.primaryBt1, Config.primaryBt2])),
      child: Text(
        _title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  static Widget cmexbutton(List<ExtraChild> child, int _border) {
    List<Widget> expaned = [];
    var index = 0;
    var boxDecor;
    for (var item in child) {
      if (_border == 1) {
        if (index == 0) {
          boxDecor = BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
          );
        } else if (index == child.length - 1) {
          boxDecor = BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5), topRight: Radius.circular(5)),
          );
        }
      }
      expaned.add(Expanded(
        flex: item.size,
        child: Container(
            decoration: boxDecor,
            alignment: Alignment.center,
            child: item.child),
      ));
      index++;
    }

    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: expaned,
      ),
    );
  }

  static Widget cmtext(String title, BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: title,
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.cyan,
          )),
    );
  }

  static Widget cmback(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}

class ExtraChild {
  final dynamic child;
  final int size;
  final Color color;

  const ExtraChild({this.child, this.size, this.color});
}
