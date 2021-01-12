import 'package:flutter/material.dart';
import 'package:prjsh/config/configuration.dart';

class EntryField {
  static Widget create(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Config.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(obscureText: isPassword, decoration: InputDecoration())
        ],
      ),
    );
  }
}
