import 'package:flutter/material.dart';
import 'package:tasks/utils/app_theme.dart';
import 'package:tasks/utils/constantes.dart';
import '../../data/model/Task.dart';
import '../../logic/bloc_export.dart';
import '../../utils/app_locale.dart';
import '../widgets/body.dart';
import '../widgets/nav_bottom_bar.dart';
import 'Search.dart';

class HomeList extends StatelessWidget {
  HomeList({Key? key}) : super(key: key);

  bool? switchValue;
  bool isEnglish = true;
  bool? isSearch = false;
  bool? isLight = true;
  bool? isList = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchThemeBloc, SwitchState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          /// bloc of theme
          theme: state.switchValue
              ? AppThemes.appThemeData[AppTheme.darkTheme]
              : AppThemes.appThemeData[AppTheme.lightTheme],

          //cubit of localization

          home: BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, state) {
              if (state is ChangeLocalState) {
                return Scaffold(
                  appBar: AppBar(elevation: 0, actions: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // const SizedBox(width: 30),
                          IconButton(
                              onPressed: () => gridToList(isList!),
                              icon: Icon(isList == false
                                  ? Icons.pivot_table_chart
                                  : Icons.grid_view_outlined)),
                          SizedBox(
                            child: TextButton(
                                onPressed: () {
                                  BlocProvider.of<LocaleCubit>(context)
                                      .cahngeLanguage('ar');
                                  AppLocalizations(locale: Locale('en'))
                                      .IsEnglish();
                                },
                                child: Text('ar',
                                    style: TextStyle(
                                        color: AppThemes.splashColor,
                                        fontSize: 16))),
                          ),

                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 80),
                            child: Text(' My Tasks',
                                // AppLocalizations.of(context)
                                //   .translate('MyTasksONAppBar')!,
                                style: const TextStyle(fontSize: 25)),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Search()));
                              },
                              icon: const Icon(Icons.search))
                        ],
                      ),
                    ),
                  ]),

                  // this for body
                  body: BodyList(value: isList, isLight: isLight!),
                  // body
                  floatingActionButton: FloatingActionButton(
                      shape: const CircleBorder(),
                      child: const Icon(Icons.add),
                      onPressed: () {
                        showBottomSheet(context);
                      }),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: NavBottomBar(),
                );
              }
              return const ScaffoldMessenger(
                  child: Center(child: CircularProgressIndicator()));
            },
          ),
        );
      },
    );
  }

  void gridToList(bool falge) {
    if (falge == true) {
      BodyList(
        value: isList,
      );
      // setState(() {
      isList = false;
      // });
    } else {
      BodyList(value: false);
      // setState(() {
      isList = true;
      // });
    }
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
                      context.read<TasksBloc>().add(AddTask(task: task1));
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
            )),
      );
    },
  );
}
