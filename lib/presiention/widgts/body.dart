import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks/presiention/widgts/task_widget.dart';
import 'package:tasks/utils/valuse.dart';

import '../../data/post.dart';

class BodyList extends StatelessWidget {
  const BodyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 100, top: 20, bottom: 30),
              child: const Text(
                'What is new ?',
                style: TextStyle(fontSize: 30, color: Colors.red),
              )),
          Expanded(
            child: Column(
                children: List.generate(
              ListData.length,
              (index) {
                final tile = ListData[index];
                return myWidget(tile.title, tile.content, tile.id);
              },
            )),
          )
        ],
      ),
    );
  }
}
