// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks/UI/widgets/body.dart';
import 'package:tasks/data/Task.dart';

import '../../logic/Bloc_export.dart';
import '../../utils/AppColors.dart';

class HomeList extends StatefulWidget {
  HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  bool? switchValue = false;
  bool? isSearch = false;
  void Ischange() {
    setState(() {
      isSearch = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.mainColor,
            actions: [
              SizedBox(
                child: isSearch == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // theme
                          BlocBuilder<SwitchBloc, SwitchState>(
                            builder: (context, state) {
                              return Switch(
                                value: state.switchValue,
                                onChanged: (newValue) {
                                  newValue
                                      ? context
                                          .read<SwitchBloc>()
                                          .add(Onevent())
                                      : context
                                          .read<SwitchBloc>()
                                          .add(Offevent());
                                },
                              );
                            },
                          ),
                          const SizedBox(width: 30),
                          IconButton(
                              onPressed: () => setState(() {
                                    switchValue = true;
                                  }),
                              icon: Icon(
                                Icons.pivot_table_chart,
                              )),
                          const SizedBox(width: 30),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            child: Text('My Tasks',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                )),
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                              onPressed: () => setState(() {
                                    isSearch = true;
                                  }),
                              icon: const Icon(Icons.search))
                        ],
                      )
                    : Expanded(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => setState(() {
                                      isSearch = false;
                                    }),
                                icon: Icon(Icons.cancel_outlined)),
                            Container(
                              height: 60,
                              width: 380,
                              margin: EdgeInsets.all(5),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    labelText: 'search',
                                    suffixIcon: Icon(Icons.search_sharp),
                                    border: OutlineInputBorder()),
                              ),
                            ),
                          ],
                        ),
                      ),
              )
            ]),
        body: BodyList(Value: switchValue),
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: AppColors.floatingColor,
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {
              ShowBottomSheet(context);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return BottomNavigationBar(
              backgroundColor: AppColors.bottomNavColor,
              currentIndex: 0,
              selectedItemColor: HexColor("#FF4444").withOpacity(0.7),
              selectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              unselectedItemColor: AppColors.bottomIconColor,
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.bottomIconColor),
              elevation: 0,
              showSelectedLabels: false,
              // var value = true ,
              onTap: (value) => context.read<SwitchBloc>().add(Offevent()),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.nightlight_outlined,
                      size: 25,
                    ),
                    label: "theme"),
              ],
            );
          },
        ),
      ),
    );
  }
}

Future<dynamic> ShowBottomSheet(BuildContext context) {
  TextEditingController txTilte = TextEditingController();
  TextEditingController txDesc = TextEditingController();
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
