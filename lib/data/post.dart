import 'package:flutter/cupertino.dart';

class postData {
  final String title;
  final String content;
  final String id;
  Icon? d;
  postData({required this.id, required this.title, required this.content});
}

List<postData> ListData = [
  postData(title: "sddf", content: "dsf", id: "90"),
  postData(title: 'beshoy ', content: 'content', id: '91'),
  postData(title: 'amg', content: 'content', id: '92'),
];
