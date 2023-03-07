import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'UI/blocs/Bloc_export.dart';
import 'UI/blocs/my_bloc_obseriver.dart';
import 'app.dart';
import 'logic/helpers/cash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  // to take instance of bloce observer
  Bloc.observer = MyBlocObserver();
  // this will init the cashed locale
  await CacheHelper.init();
  runApp(const MyApp());
}
