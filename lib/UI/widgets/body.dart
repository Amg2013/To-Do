// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tasks/UI/widgets/task_widget.dart';

import '../../data/model/Task.dart';
import '../../logic/Bloc_export.dart';

class BodyList extends StatelessWidget {
  Task? task;
  bool? Value;
  BodyList({
    this.Value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                    margin:
                        const EdgeInsets.only(right: 100, top: 20, bottom: 30),
                    child: const Text(
                      'What is new ?',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )),
                Expanded(
                    child: Value == false
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: taskList.length,
                            itemBuilder: (context, int index) {
                              var task = taskList[index];
                              return MyWidget1(
                                  task: task,
                                  description: task.description,
                                  id: task.id,
                                  titel: task.title);
                            },
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300),
                            shrinkWrap: true,
                            itemCount: taskList.length,
                            itemBuilder: (context, int index) {
                              var task = taskList[index];
                              return Grid_widget(
                                  task: task,
                                  description: task.description,
                                  id: task.id,
                                  titel: task.title);
                            },
                          )),
              ],
            ));
      },
    );
  }
}
