import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Container myWidget(final String titel, final String content, String name) {
  bool? falg;
  dynamic x = 0xFFD45741, y;
  return Container(
      height: 70,
      width: 380,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: HexColor('#FF4444'),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.check_box_outlined),
          SizedBox(width: 10),
          Text(titel),
          SizedBox(width: 50),
          Icon(Icons.delete_outline_sharp)
        ],
      )));
}
