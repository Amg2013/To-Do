import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';
import 'logic/bloc_export.dart';
import 'logic/helpers/cash.dart';
import 'logic/my_bloc_obseriver.dart';

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
