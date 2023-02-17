import 'package:flutter/material.dart';
import 'task_widget.dart';

import '../../data/model/Task.dart';
import '../../logic/bloc_export.dart';

// ignore: must_be_immutable
class BodyList extends StatelessWidget {
  Task? task;
  bool? value;
  BodyList({
    this.value,
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
                    child: value == false
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
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300),
                            shrinkWrap: true,
                            itemCount: taskList.length,
                            itemBuilder: (context, int index) {
                              var task = taskList[index];
                              return Gridwidget(
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
