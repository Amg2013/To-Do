// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../utils/valuse.dart';

class Bottom_sheet extends StatefulWidget {
  const Bottom_sheet({
    Key? key,
  }) : super(key: key);

  @override
  State<Bottom_sheet> createState() => _Bottom_sheetState();
}

class _Bottom_sheetState extends State<Bottom_sheet> {
  var tx1Controller = TextEditingController();
  var tx2Controller = TextEditingController();
  Future<dynamic> ShowBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: 400,
            decoration: const BoxDecoration(
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
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(color: C_Coloers.D_bottom),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(color: C_Coloers.D_bottom),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}