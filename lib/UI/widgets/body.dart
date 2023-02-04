import 'package:flutter/material.dart';
import 'package:tasks/UI/widgets/task_widget.dart';
import 'package:tasks/utils/valuse.dart';

import '../../data/Task.dart';

class BodyList extends StatelessWidget {
  const BodyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 100, top: 20, bottom: 30),
                child: const Text(
                  'What is new ?',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                )),
            ListView.builder(
              shrinkWrap: true,
              itemCount: ListData.length,
              itemBuilder: (context, int index) {
                return MyWidget('title', 'content');
              },
            ),
          ],
        ));
  }
}