import 'package:flutter/material.dart';
import '../../../../config/locale/app_locale.dart';
import '../../../blocs/Bloc_export.dart';
import '../../../widgets/task_widget.dart';

import '../../../../data/model/Task.dart';

// ignore: must_be_immutable
class BodyList extends StatelessWidget {
  Task? task;
  bool? value;
  bool? isLight;
  BodyList({
    this.value,
    Key? key,
    this.isLight,
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
                        const EdgeInsets.only(right: 120, top: 20, bottom: 30),
                    child: Text(
                      'whatisnew'.tr(context),
                      style: const TextStyle(
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
                                titel: task.title,
                                isLight: isLight!,
                              );
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
                                titel: task.title,
                                isLight: isLight,
                              );
                            },
                          )),
              ],
            ));
      },
    );
  }
}
