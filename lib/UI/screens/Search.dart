import 'package:flutter/material.dart';
import '../../data/model/Task.dart';
import '../widgets/task_widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchController = TextEditingController();

  final List<Task> listToSearch = [];
  //
  List<Task> foundedTasks = [
    Task(id: 'id', title: 'title', description: 'description')
  ];

  void _runFilter(String enteredKeyword) {
    List<Task> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all tasks
      results = listToSearch;
    } else {
      results = foundedTasks
          .where((task) =>
              task.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  initState() {
    foundedTasks = listToSearch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, elevation: 0, actions: [
        Center(
          child: Container(
              height: 60,
              width: 380,
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
                      labelText: 'search',
                      suffixIcon: const Icon(Icons.search_sharp),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )))),
        ),
      ]),
      body: foundedTasks.isNotEmpty
          ? Container(
              height: double.infinity,
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                  itemCount: listToSearch.length,
                  itemBuilder: (context, index) {
                    final task = listToSearch[index];
                    return MyWidget1(
                        description: '${Text(foundedTasks[index].description)}',
                        id: '${Text(foundedTasks[index].id)}',
                        titel: '${Text(foundedTasks[index].title)}',
                        task: task);
                  }))
          : const Center(
              child: Text(
              'no thing find',
              style: TextStyle(fontSize: 24),
            )),
    ));
  }
}
