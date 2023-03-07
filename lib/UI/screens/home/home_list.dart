import 'package:flutter/material.dart';

import '../../../config/locale/app_locale.dart';
import '../../../config/routes/app_routs.dart';
import '../../../config/themes/app_theme.dart';
import '../../../data/model/Task.dart';
import '../../blocs/Bloc_export.dart';
import '../../blocs/list_grid_cubit/list_gird_cubit.dart';
import '../../blocs/list_grid_cubit/list_grid_state.dart';
import 'widgets/app_bar.dart';
import 'widgets/body.dart';
import 'widgets/nav_bottom_bar.dart';

// ignore: must_be_immutable
class HomeList extends StatelessWidget {
  HomeList({
    Key? key,
  }) : super(key: key);

  bool? switchValue;
  bool isEnglish = true;
  bool? isSearch = false;
  bool? isLight = true;
  bool? isListCheck = true;

  @override
  Widget build(BuildContext context) {
    // dev.log('onThe top of HomeList', name: state.switchValue.toString());
    /// then this bloc for locale
    return BlocProvider(
      create: (context) => ListToGrideCubit(),
      child: BlocBuilder<ListToGrideCubit, ListToGrideState>(
        builder: (context, state) {
          return Scaffold(
            // drawer: Drawer(
            //   backgroundColor: AppThemes.splashColor,
            // ),
            appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                actions: const [
                  HomeAppBar(),
                ]),

            // this for body
            body: BodyList(value: state.isList, isLight: isLight!),

            // body
            floatingActionButton: const FloatingAction(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: NavBottomBar(),
          );
        },
      ),
    );
  }
}

class FloatingAction extends StatelessWidget {
  const FloatingAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        onPressed: () {
          showBottomSheet(context);
        });
  }
}

Future<dynamic> showBottomSheet(BuildContext context) {
  TextEditingController txTilte = TextEditingController();
  TextEditingController txDesc = TextEditingController();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,

    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),

    //
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: .4,
        maxChildSize: .8,
        builder: (context, scrollController) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
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
                        counterText: 'firstHintTextOfShowModel'.tr(context),
                        hintText: 'secondtHintTextOfShowModel'.tr(context),
                        border: const OutlineInputBorder()),
                    textDirection: TextDirection.ltr,
                  ),
                  TextField(
                    controller: txDesc,
                    decoration: InputDecoration(
                        counterText: 'firstHintTextOfShowModel'.tr(context),
                        hintText: 'firstHintTextOfShowModel'.tr(context),
                        border: const OutlineInputBorder()),
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
                          color: AppThemes.bottomOfShowModel,
                          borderRadius: BorderRadius.circular(90)),
                      child: Center(
                        child: Text(
                          'saveBottom'.tr(context),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      );
    },
  );
}
