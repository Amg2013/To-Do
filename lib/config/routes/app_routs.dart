import 'package:flutter/material.dart';
import 'package:tasks/UI/screens/home/home_list.dart';
import 'package:tasks/UI/screens/search.dart';
import 'package:tasks/UI/screens/search/search1.dart';
import 'package:tasks/UI/screens/splash/splash.dart';

import '../constants/constnts.dart';

class Routes {
  static const String intilaRoute = '/';
  static const String home = '/HomeList';
  static const String search = '/Search';
}

class AppRoutes {
  static Route? onGeranteRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intilaRoute:
        return MaterialPageRoute(builder: (context) => const Splash());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeList());
      case Routes.search:
        return MaterialPageRoute(builder: (context) => Search());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => Scaffold(
              body: Center(
                  child: Constants.showErrorDilog(
                      context: context, msg: 'pleas restart the app')),
            )));
  }
}
