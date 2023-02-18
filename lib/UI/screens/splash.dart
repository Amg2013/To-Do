import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasks/utils/app_theme.dart';
import 'package:tasks/utils/constantes.dart';

import 'home_list.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const HomeList()));
    });
  }

  bool isfinshed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemes.splashColor,
        elevation: 0,
        title: Text(
          AppStrings.titleOfSplash,
          style: TextStyle(
              color: AppThemes.mainColor, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        Container(
            color: AppThemes.splashColor,
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
                    child: Image.asset(AssetsName.imageOfLogo),
                  ),
                  // line image
                  Container(
                    width: 210,
                    height: 50,
                    margin: const EdgeInsets.only(top: 30, right: 80),
                    child: Image.asset(AssetsName.imageOfLine),
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
                        children: [
                          Text(
                            AppStrings.hiderTitleOneONSplash,
                            style: TextStyle(
                                color: AppThemes.mainColor,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            AppStrings.hiderTitleTwoOnSplash,
                            style: TextStyle(
                                color: AppThemes.mainColor,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )), // texts
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
                  //),
                ])),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        elevation: 0,
        backgroundColor: null,
        foregroundColor: null,
        child: Image.asset(AssetsName.imageOfCupe),
      ),
    );
  }

  // void onFinish() async {
  //   await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomeList(),
  //       ));
  // }

  // void onWaitingProcess() {
  //   Future.delayed(const Duration(seconds: 1), () {
  //     setState(() {
  //       isfinshed = true;
  //     });

  //   });

}
