// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:tasks/UI/screens/skitch.dart';
import 'package:tasks/UI/widgets/Other_task_list.dart';
import '../../data/Task.dart';
import '../../logic/Bloc_export.dart';
import '../../logic/bloc/switch_bloc.dart';
import '../widgets/body.dart';

class HomeList1 extends StatefulWidget {
  const HomeList1({super.key});

  @override
  State<HomeList1> createState() => _HomeList1State();
}

class _HomeList1State extends State<HomeList1> {
  bool? switchValue;
  TextEditingController txTilte = TextEditingController();
  TextEditingController txDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          List<Task> tasksList = state.allTasks;

          return Scaffold(
            appBar:
                AppBar(elevation: 0, backgroundColor: Colors.white, actions: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // theme
                    BlocBuilder<SwitchBloc, SwitchState>(
                      builder: (context, state) {
                        return Switch(
                          value: state.switchValue,
                          onChanged: (newValue) {
                            newValue
                                ? context.read<SwitchBloc>().add(Onevent())
                                : context.read<SwitchBloc>().add(Offevent());
                          },
                        );
                      },
                    ),
                    // BlocBuilder<SwitchBloc, SwitchState>(
                    // builder: (context, state) {
                    //   return IconButton(
                    //       icon: Icon(
                    //         Icons.dark_mode_outlined,
                    //         color: Colors.black12,
                    //       ),
                    //       onPressed: () {
                    //         setState(() {
                    //           switchValue = true;
                    //         });
                    //       });
                    // },
                    // ),
                    IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.pivot_table_chart,
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: Text('My Tasks',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )),
                    ),
                    IconButton(onPressed: null, icon: const Icon(Icons.search))
                  ],
                ),
              )
            ]),
            // this is the end of appBar
            // affter that i will implment the naveBar but it take the body
            // of scaffold and it's child is my list

            body: SpinCircleBottomBarHolder(
              bottomNavigationBar: SCBottomBarDetails(
                  // this for the big button
                  actionButtonDetails: SCActionButtonDetails(
                      color: Colors.black,
                      icon: Icon(
                        Icons.add,
                        size: 40,
                      ),
                      elevation: 0),
                  // this this the Icons of the Big Icon
                  circleItems: [
                    SCItem(
                        icon: Icon(Icons.add_alert_outlined),
                        onPressed: () {
                          ShowBottomSheet(context);
                        }),
                    SCItem(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          ShowBottomSheet(context);
                        }),
                  ],
                  // icons of the bar
                  items: [
                    SCBottomBarItem(
                        icon: Icons.home_outlined,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => Skitch()));
                        }),
                    SCBottomBarItem(
                        icon: Icons.dark_mode_outlined,
                        onPressed: (newValue) {
                          setState(() {
                            switchValue = newValue;
                          });
                        }),
                  ],
                  circleColors: [
                    Colors.red,
                    Colors.blue,
                    Colors.amber
                  ]),
              child: BodyList(),
            ),
          );
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  // this method if for bottom sheet adding task
  Future<dynamic> ShowBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(100),
                topEnd: Radius.circular(90),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: txTilte,
                    decoration: InputDecoration(
                        counterText: 'Todo title',
                        hintText: 'Todo title..... ',
                        border: OutlineInputBorder()),
                    textDirection: TextDirection.ltr,
                  ),
                  TextField(
                    controller: txDesc,
                    decoration: InputDecoration(
                        counterText: 'Todo title',
                        hintText: 'Todo title..... ',
                        border: OutlineInputBorder()),
                    textDirection: TextDirection.ltr,
                  ),
                  GestureDetector(
                    onTap: () {
                      var task1 = Task(
                          title: txTilte.text,
                          description: txDesc.text,
                          id: txTilte.text);
                      context.read<TasksBloc>().add(AddTask(task: task1));
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 179, 45, 35),
                          borderRadius: BorderRadius.circular(90)),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
