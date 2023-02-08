import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tasks/UI/screens/ListTasks.dart';
import 'package:tasks/UI/widgets/body.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0, flexibleSpace: Row(), actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.cancel_outlined)),
              Container(
                height: 60,
                width: 380,
                margin: const EdgeInsets.all(5),
                child: const TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'search',
                      suffixIcon: Icon(Icons.search_sharp),
                      border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ]),
        body: Container(
          height: double.infinity,
          margin: const EdgeInsets.all(20),
          child: BodyList(Value: false),
        ),
      ),
    );
  }
}
