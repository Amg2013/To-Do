// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:tasks/utils/AppTheme.dart';

// import '../../utils/valuse.dart';

// class BottomSheet extends StatefulWidget {
//   const BottomSheet({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<BottomSheet> createState() => _BottomSheetState();
// }

// class _BottomSheetState extends State<BottomSheet> {
//   var tx1Controller = TextEditingController();
//   var tx2Controller = TextEditingController();
//   Future<dynamic> showBottomSheet(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//             height: 400,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadiusDirectional.only(
//                 topStart: Radius.circular(90),
//                 topEnd: Radius.circular(90),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 textDirection: TextDirection.ltr,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   const TextField(
//                     //controller: taskContlroller,
//                     decoration: InputDecoration(
//                         counterText: 'Todo title',
//                         hintText: 'Todo title..... ',
//                         border: OutlineInputBorder()),
//                     textDirection: TextDirection.ltr,
//                   ),
//                   GestureDetector(
//                     child: Container(
//                       decoration: const BoxDecoration(color: Colors.amber),
//                       child: const Center(
//                         child: Text(
//                           'Save',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 25),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ));
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         textDirection: TextDirection.ltr,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           const TextField(
//             //controller: taskContlroller,
//             decoration: InputDecoration(
//                 counterText: 'Todo title',
//                 hintText: 'Todo title..... ',
//                 border: OutlineInputBorder()),
//             textDirection: TextDirection.ltr,
//           ),
//           GestureDetector(
//             child: Container(
//               decoration: BoxDecoration(color: Colors.amber),
//               child: const Center(
//                 child: Text(
//                   'Save',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
