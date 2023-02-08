// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks/data/Task.dart';
import '../../logic/Bloc_export.dart';

class Grid_widget extends StatelessWidget {
  final String? titel;
  final String? description;
  final String? id;
  final Task task; //= Task(description: 'sd', id: 'klm', title: 'adsf');
  Grid_widget(
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
          child: Expanded(
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
                child: Text(
                  'k;lk;',
                  style: TextStyle(fontSize: 18, color: Color(0xFFF4E8E8)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => context.read<TasksBloc>()
                      ..add(completedTasks(task: task)),
                    icon: Icon(task.isDone == false
                        ? Icons.check_box_outline_blank_sharp
                        : Icons.check_box_outlined),
                  ),
                  IconButton(
                      icon: Icon(Icons.delete_outline_outlined),
                      onPressed: () => context.read<TasksBloc>()
                        ..add(DeleteTask(task: task))),
                ],
              )
            ],
          )));
    });
  }

  // end of class
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

class MyWidget1 extends StatelessWidget {
  late final String titel;
  late final String description;
  late final String id;
  final Task task; //= Task(description: 'sd', id: 'klm', title: 'adsf');
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
            child: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(Icons.delete_outline_outlined),
                    onPressed: () =>
                        context.read<TasksBloc>()..add(DeleteTask(task: task))),
                //  const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(titel), Text(description)],
                ),
                IconButton(
                  onPressed: () => context.read<TasksBloc>()
                    ..add(completedTasks(task: task)),
                  icon: Icon(task.isDone == false
                      ? Icons.check_box_outline_blank_sharp
                      : Icons.check_box_outlined),
                ),
              ],
            )));
      },
    );
  }
}
