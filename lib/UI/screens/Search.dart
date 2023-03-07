// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tasks/config/locale/app_locale.dart';
import 'package:tasks/logic/bloc_export.dart';
import '../../data/model/Task.dart';
import '../widgets/task_widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();

  late List<Task> listToSearch;

  List<Task> listOfReslts = [];

  void _runFilter(String enteredKeyword) {
    late List<Task> results;
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all tasks
      results = listToSearch;
    } else {
      results = listToSearch
          .where((task) =>
              task.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      setState(() {
        listOfReslts = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        listToSearch = state.allTasks;
        // listOfReslts = listToSearch;
        debugPrint(listToSearch.length.toString());
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
                          // labelText: 'search'.tr(context),
                          suffixIcon: const Icon(Icons.search_sharp),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          )))),
            ),
          ]),
          body: listOfReslts.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: const EdgeInsets.all(20),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listOfReslts.length,
                          itemBuilder: (context, int index) {
                            var task = listOfReslts[index];
                            return Gridwidget(
                              task: task,
                              description: task.description,
                              id: task.id,
                              titel: task.title,
                              isLight: true,
                            );
                            // return MyWidget1(
                            //   description:
                            //       '${Text(foundedTasks[index].description)}',
                            //   id: '${Text(foundedTasks[index].id)}',
                            //   titel: '${Text(foundedTasks[index].title)}',
                            //   task: task,
                            //   isLight: true,
                            // );
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
