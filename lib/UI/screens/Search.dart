// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../widgets/task_widget.dart';
import '../../data/model/Task.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();
  late List<Task> listToSearch = [
    Task(id: 'id', title: 'title', description: 'descrap'),
  ];

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(elevation: 0, actions: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel_outlined)),
            Container(
              height: 60,
              width: 380,
              margin: const EdgeInsets.all(5),
              child: TextField(
                controller: searchController,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: 'search',
                    suffixIcon: Icon(Icons.search_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    )),
              ),
            ),
          ],
        ),
      ]),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: listToSearch.length,
            itemBuilder: (context, index) {
              final task = listToSearch[index];
              return MyWidget1(
                  description: task.description,
                  id: task.id,
                  titel: task.title,
                  task: task);
            }),
      ),
    ));
  }
}
