// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import 'bloc_export.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    debugPrint(event.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint(error.toString());
    //print(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}
