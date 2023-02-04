// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Container MyWidget(String titel, String content) {
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
          IconButton(
            icon: Icon(Icons.check_box_outlined),
            onPressed: () {},
          ),
          SizedBox(width: 10),
          Text(titel),
          SizedBox(width: 50),
          IconButton(
            icon: Icon(Icons.delete_sweep_outlined),
            onPressed: () {},
          ),
        ],
      )));
}

Container GridWidget(String titel, String content) {
  return Container(
      height: 220,
      width: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: HexColor('#FF4444'),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            titel,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 40,
            child: Text(
              content,
              style: TextStyle(fontSize: 18, color: Color(0xFFF4E8E8)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.check_box_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete_sweep_outlined),
                onPressed: () {},
              ),
            ],
          )
        ],
      )));
}

Container WhenADDingWidget(final String titel, final String content) {
  return Container(
      height: 80,
      width: 400,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: HexColor('#FF4444'),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Text(
          titel,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ));
}
