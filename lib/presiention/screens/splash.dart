import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:tasks/presiention/screens/HomeList.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomeList1()));
      },
    );
  }

  bool isfinshed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('DB2323'),
        elevation: 0,
        title: const Text(
          'My Tasks',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
            color: HexColor('DB2323'),
            height: double.infinity,
            width: double.infinity,
            child: Column(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // first image
                  SizedBox(
                    width: 340,
                    height: 500,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  // line image
                  Container(
                    width: 210,
                    height: 50,
                    margin: const EdgeInsets.only(top: 30, right: 80),
                    child: Image.asset('assets/images/Line 2.png'),
                  ),
                  // continer for text
                  Container(
                      margin: const EdgeInsets.only(
                        right: 150,
                      ),
                      height: 100,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'Good                     ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            '          Consitancy',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )), // texts
                  Positioned(
                    bottom: 20,
                    left: 300,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Image.asset('assets/images/Vector.png'),
                    ),
                    // SwipeableButtonView(
                    //     onFinish: onFinish,
                    //     isFinished: isfinshed,
                    //     onWaitingProcess: onWaitingProcess,
                    //     activeColor: C_Coloers.light_back,
                    //     buttonWidget: const Icon(
                    //       Icons.arrow_forward_ios,
                    //       color: Color.fromARGB(255, 233, 240, 245),
                    //     ),
                    //     buttonText: 'Swip to start'),
                  ),
                ])),
      ]),
      // floatingActionButton:IconButton(onPressed: null , icon: Icon(Icon.Vector),) ,
    );
  }

  void onFinish() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeList1(),
        ));
  }

  void onWaitingProcess() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isfinshed = true;
      });
    });
  }
}
