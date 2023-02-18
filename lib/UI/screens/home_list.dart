import 'package:flutter/material.dart';
import 'package:tasks/utils/app_theme.dart';
import 'package:tasks/utils/constantes.dart';

import '../../data/model/Task.dart';
import '../../logic/bloc_export.dart';
import '../widgets/body.dart';
import '../widgets/nav_bottom_bar.dart';
import 'Search.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  bool? switchValue;
  bool? isSearch = false;
  bool? isLight = true;
  bool? isList = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0, actions: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // const SizedBox(width: 30),
                IconButton(
                    onPressed: () => gridToList(isList!),
                    icon: Icon(isList == false
                        ? Icons.pivot_table_chart
                        : Icons.grid_view_outlined)),
                const SizedBox(width: 60),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  child: const Text(AppStrings.titleOfNaveBar,
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                ),
                // const SizedBox(width: 20),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const Search()));
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          )
        ]),
        body: BodyList(value: isList, isLight: isLight!),
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
            onPressed: () {
              showBottomSheet(context);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: NavBottomBar(isLight: isLight!),
      ),
    );
  }

  void gridToList(bool falge) {
    if (falge == true) {
      BodyList(
        value: isList,
      );
      setState(() {
        isList = false;
      });
    } else {
      BodyList(value: false);
      setState(() {
        isList = true;
      });
    }
  }
}

Future<dynamic> showBottomSheet(BuildContext context) {
  TextEditingController txTilte = TextEditingController();
  TextEditingController txDesc = TextEditingController();
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 350,
          decoration: const BoxDecoration(
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
                  decoration: const InputDecoration(
                      counterText: AppStrings.firstHintTextOfShowModel,
                      hintText: AppStrings.secondtHintTextOfShowModel,
                      border: OutlineInputBorder()),
                  textDirection: TextDirection.ltr,
                ),
                TextField(
                  controller: txDesc,
                  decoration: const InputDecoration(
                      counterText: AppStrings.firstHintTextOfShowModel,
                      hintText: AppStrings.secondtHintTextOfShowModel,
                      border: OutlineInputBorder()),
                  textDirection: TextDirection.ltr,
                ),
                GestureDetector(
                  onTap: () {
                    var task1 = Task(
                        title: txTilte.text,
                        description: txDesc.text,
                        id: txTilte.text);
                    context.read<TasksBloc>().add(AddingTask(task: task1));
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppThemes.bottomOfShowModel,
                        borderRadius: BorderRadius.circular(90)),
                    child: const Center(
                      child: Text(
                        AppStrings.saveBottom,
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
