// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tasks/config/locale/app_locale.dart';
import 'package:tasks/logic/bloc_export.dart';
import '../../data/model/Task.dart';
import '../widgets/task_widget.dart';

class Search extends StatelessWidget {
  Search({super.key});
  final searchController = TextEditingController();
  late List<Task> listToSearch;
  late List<Task> foundedTasks;

  void _runFilter(String enteredKeyword) {
    late List<Task> results;
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all tasks
      results = listToSearch;
    } else {
      results = foundedTasks
          .where((task) =>
              task.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  }

  // @override
  //initState() {
  //   super.initState();
  //   listToSearch = const TasksState().allTasks;
  //   foundedTasks = listToSearch;
  // }

  @override
  Widget build(BuildContext context) {
    return (BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        listToSearch = state.allTasks;
        foundedTasks = listToSearch;
        return Scaffold(
          appBar:
              AppBar(automaticallyImplyLeading: false, elevation: 0, actions: [
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                  height: 60,
                  margin: const EdgeInsets.all(5),
                  child: TextField(
                      onChanged: (value) => _runFilter(value),
                      autofocus: true,
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.cancel_outlined)),
                          labelText: 'search'.tr(context),
                          suffixIcon: const Icon(Icons.search_sharp),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          )))),
            ),
          ]),
          body: foundedTasks.isNotEmpty
              ? Expanded(
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: const EdgeInsets.all(20),
                      child: ListView.builder(
                          itemCount: listToSearch.length,
                          itemBuilder: (context, index) {
                            final task = listToSearch[index];
                            return MyWidget1(
                              description:
                                  '${Text(foundedTasks[index].description)}',
                              id: '${Text(foundedTasks[index].id)}',
                              titel: '${Text(foundedTasks[index].title)}',
                              task: task,
                              isLight: true,
                            );
                          })),
                )
              : Center(
                  child: Text(
                  'nothingfind'.tr(context),
                  style: const TextStyle(fontSize: 24),
                )),
        );
      },
    ));
  }
}
