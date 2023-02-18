// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:tasks/data/model/Task.dart';
import 'package:tasks/utils/app_theme.dart';

import '../../logic/bloc_export.dart';

class Gridwidget extends StatelessWidget {
  final bool? isLight;
  final String? titel;
  final String? description;
  final String? id;
  final Task task; //= Task(description: 'sd', id: 'klm', title: 'adsf');
  Gridwidget(
      {super.key,
      required this.isLight,
      required this.description,
      required this.id,
      required this.titel,
      required this.task});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Container(
          height: 220,
          width: 200,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isLight == true
                ? AppThemes.taskWidgetColor
                : AppThemes.taskWidgetDarkColor,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                task.title,
                style: TextStyle(
                    fontSize: 20,
                    color: AppThemes.mainColor,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 40,
                child: Text(task.description,
                    style: const TextStyle(
                        fontSize: 18, color: Color(0xFFF4E8E8))),
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
                      icon: const Icon(Icons.delete_outline_outlined),
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
  final bool isLight;
  final Task task;
  MyWidget1(
      {super.key,
      required this.description,
      required this.id,
      required this.titel,
      required this.task,
      required this.isLight});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Container(
            height: 70,
            width: 380,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isLight == true
                  ? AppThemes.taskWidgetColor
                  : AppThemes.taskWidgetDarkColor,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    icon: const Icon(Icons.delete_outline_outlined),
                    onPressed: () => context.read<TasksBloc>()
                      ..add(DeleteingTask(task: task))),
                //  const SizedBox(width: 10),
              ],
            ));
      },
    );
  }
}
