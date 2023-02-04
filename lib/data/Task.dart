// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

class TaskData {
  final String title;
  final String content;
  final String id;
  Icon? d;
  TaskData({required this.id, required this.title, required this.content});
}

List<TaskData> ListData = [
  TaskData(title: "sddf", content: "dsf", id: "90"),
  TaskData(title: 'beshoy ', content: 'content', id: '91'),
  TaskData(title: 'amg', content: 'content', id: '92'),
];
