// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks/data/Task.dart';

import '../widgets/task_widget.dart';

class Skitch extends StatefulWidget {
  const Skitch({super.key});

  @override
  State<Skitch> createState() => _SkitchState();
}

class _SkitchState extends State<Skitch> {
  late final Task taskData = Task(
      title: 'dfs',
      description: ' dsf',
      id: 'd1',
      isDeleted: false,
      isDone: false);

  save() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(taskData.title, taskData.description);
  }

  String? TaskName;

  ShowData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      TaskName = pref.getString(taskData.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AMG')),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              // TextButton(
              //   onPressed: save,
              //   child: MyWidget1('tttttttttt', 'content', 'sd'),
              // ),
              Row(
                children: [
                  GridWidget('jkl;j', ' i wil go to playground'),
                  GridWidget('titel Grid2', ' i wil go to playground')
                ],
              ),
              Row(
                children: [
                  GridWidget('titel Grid', ' i wil go to playground'),
                  GridWidget('titel Grid2', ' i wil go to playground')
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              WhenADDingWidget('titel2', 'I wan to go sleep now'),
              const Text('sdfkjhg'),
            ],
          )),
    );
  }

  onClosing() {}
}
