// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:tasks/presiention/screens/skitch.dart';
import '../../utils/valuse.dart';
import '../widgts/body.dart';

class HomeList1 extends StatefulWidget {
  const HomeList1({super.key});

  @override
  State<HomeList1> createState() => _HomeList1State();
}

class _HomeList1State extends State<HomeList1> {
  final SharedPreferences pref =
      SharedPreferences.getInstance() as SharedPreferences;

  void save() async {
    pref.setString('sdf', "sdf");
  }

  getTask() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.white, actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: null, icon: Icon(Icons.pivot_table_chart)),
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
        body: SpinCircleBottomBarHolder(
          bottomNavigationBar: SCBottomBarDetails(
              actionButtonDetails: SCActionButtonDetails(
                  color: Colors.black,
                  icon: Icon(
                    Icons.add,
                    size: 40,
                  ),
                  elevation: 0),
              items: [
                SCBottomBarItem(
                    icon: Icons.home_outlined,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Skitch()));
                    }),
                SCBottomBarItem(
                    icon: Icons.dark_mode_outlined, onPressed: () {}),
              ],
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
              circleColors: [
                Colors.red,
                Colors.blue,
                Colors.amber
              ]),
          child: BodyList(),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> ShowBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(90),
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
                  const TextField(
                    //controller: taskContlroller,
                    decoration: InputDecoration(
                        counterText: 'Todo title',
                        hintText: 'Todo title..... ',
                        border: OutlineInputBorder()),
                    textDirection: TextDirection.ltr,
                  ),
                  const TextField(
                    //controller: taskContlroller,
                    decoration: InputDecoration(
                        counterText: 'Todo title',
                        hintText: 'Todo title..... ',
                        border: OutlineInputBorder()),
                    textDirection: TextDirection.ltr,
                  ),
                  GestureDetector(
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
