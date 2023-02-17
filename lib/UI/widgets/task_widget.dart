// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks/data/model/Task.dart';

import '../../logic/bloc_export.dart';

class Gridwidget extends StatelessWidget {
  final String? titel;
  final String? description;
  final String? id;
  final Task task; //= Task(description: 'sd', id: 'klm', title: 'adsf');
  Gridwidget(
      {required this.description,
      required this.id,
      required this.titel,
      required this.task});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Container(
          height: 220,
          width: 200,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: HexColor('#FF4444'),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                task.title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 40,
                child: Text(task.description,
                    style: TextStyle(fontSize: 18, color: Color(0xFFF4E8E8))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () => context.read<TasksBloc>()
                        ..add(CompleteingTasks(task: task)),
                      icon: Icon(task.isDone == false
                          ? Icons.check_box_outline_blank_sharp
                          : Icons.check_box_outlined)),
                  IconButton(
                      icon: Icon(Icons.delete_outline_outlined),
                      onPressed: () => context.read<TasksBloc>()
                        ..add(DeleteingTask(task: task))),
                ],
              )
            ],
          ));
    });
  }

  // end of class
}

class MyWidget1 extends StatelessWidget {
  late final String titel;
  late final String description;
  late final String id;
  final Task task;
  MyWidget1(
      {required this.description,
      required this.id,
      required this.titel,
      required this.task});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Container(
            height: 70,
            width: 380,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: HexColor('#FF4444'),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => context.read<TasksBloc>()
                    ..add(CompleteingTasks(task: task)),
                  icon: Icon(task.isDone == false
                      ? Icons.check_box_outline_blank_sharp
                      : Icons.check_box_outlined),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(titel), Text(description)],
                ),

                IconButton(
                    icon: Icon(Icons.delete_outline_outlined),
                    onPressed: () => context.read<TasksBloc>()
                      ..add(DeleteingTask(task: task))),
                //  const SizedBox(width: 10),
              ],
            ));
      },
    );
  }
}
