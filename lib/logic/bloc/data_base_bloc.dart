import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/model/Task.dart';

part 'data_base_event.dart';
part 'data_base_state.dart';

class DataBaseBloc extends Bloc<DataBaseEvent, DataBaseState> {
  DataBaseBloc() : super(DataBaseInitial()) {
    on<DataBaseEvent>((event, emit) {});
    on<InsertTaskTodb>((insertToDatabase));
  }
}

Database? database;
_insertToDatabase() {}

// Future<void> initDatabase() async {
//   final Path = await getDatabasesPath();

//   if (await Directory(dirname(path)).exists()) {
//     database = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       // When creating the db, create the table
//       await db.execute('CREATE TABLE todo (id INTEGER PRIMARY KEY, name TEXT)');
//     });
//     emit(All());
//   } else {
//     try {
//       await Directory(dirname(path)).create(recursive: true);
//       database = await openDatabase(path, version: 1,
//           onCreate: (Database db, int version) async {
//         // When creating the db, create the table
//         await db
//             .execute('CREATE TABLE todo (id INTEGER PRIMARY KEY, name TEXT)');
//       });
//       emit(L());
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
