// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tasks/config/locale/app_locale.dart';
// import 'package:tasks/data/model/task.dart';

// import '../../../logic/Tasks_block/tasks_bloc.dart';
// import '../../widgets/task_widget.dart';

// class SeaechEx extends StatefulWidget {
//   SeaechEx({super.key});

//   @override
//   State<SeaechEx> createState() => _SeaechExState();
// }

// class _SeaechExState extends State<SeaechEx> {
//   late List<Task> listToSearch;
//   @override
//   void initState() {
//     super.initState();
//     listToSearch =
//         BlocProvider.of<TasksBloc>(context).state.allTasks as List<Task>;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TasksBloc, TasksState>(
//       builder: (context, state) {
//         listToSearch = state.allTasks as List<Task>;
//         return Scaffold(
//             appBar: AppBar(
//                 automaticallyImplyLeading: false,
//                 elevation: 0,
//                 actions: [SearchAppBar2()]),
//             body: Expanded(
//               child: Container(
//                   width: double.infinity,
//                   height: double.infinity,
//                   margin: const EdgeInsets.all(20),
//                   child: ListView.builder(
//                       itemCount: listToSearch.length,
//                       itemBuilder: (context, int index) {
//                         var task = listToSearch[index];
//                         return MyWidget1(
//                           task: task,
//                           description: task.description,
//                           id: task.id,
//                           titel: task.title,
//                           isLight: true,
//                         );
//                       })),
//             ));
//       },
//     );
//   }
// }

// class SearchAppBar2 extends StatelessWidget {
//   SearchAppBar2() : super();

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       fit: FlexFit.loose,
//       child: Container(
//           height: 60,
//           margin: const EdgeInsets.all(5),
//           child: TextField(
//               onChanged: (value) => null,
//               autofocus: true,
//               decoration: InputDecoration(
//                   prefixIcon: IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.cancel_outlined)),
//                   labelText: 'search'.tr(context),
//                   suffixIcon: const Icon(Icons.search_sharp),
//                   border: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                   )))),
//     );
//   }
// }
