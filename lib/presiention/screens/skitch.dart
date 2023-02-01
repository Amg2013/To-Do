import 'package:flutter/material.dart';
import 'package:tasks/presiention/screens/HomeList.dart';

import '../widgts/task_widget.dart';

class Skitch extends StatefulWidget {
  const Skitch({super.key});

  @override
  State<Skitch> createState() => _SkitchState();
}

class _SkitchState extends State<Skitch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  child: myWidget('titel', 'content', 'name'),
                ),
                onTap: () {
                  BottomSheet(
                    onClosing: onClosing,
                    builder: (context) {
                      return Container();
                    },
                  );
                },
              ),
            ],
          )),
    );
  }

  onClosing() {}
}
