import 'package:flutter/cupertino.dart';

import 'Bloc_export.dart';

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
