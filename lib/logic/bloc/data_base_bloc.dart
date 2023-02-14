import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/data sources/dataBase.dart';
import '../../data/model/Task.dart';

part 'data_base_event.dart';
part 'data_base_state.dart';

class DataBaseBloc extends Bloc<DataBaseEvent, DataBaseState> {
  late SqlDb db;
  DataBaseBloc() : super(DataBaseInitial()) {
    on<DataBaseEvent>((event, emit) {});
    //on<InsertTaskTodb>((insertToDatabase));
  }
}

Database? database;
_insertToDatabase() {}

Future<void> initDatabase() async {
  final Path = await getDatabasesPath();
  Path = db.path;
  if (await Directory(Path).exists()) {
    database = await openDatabase(Path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE tasks (id TEXT PRIMARY KEY , title TEXT,status INTEGER)');
      print('dataBase created form blocc');
    });
  } else {
    try {
      await Directory(Path).create(recursive: true);
      database = await openDatabase(Path, version: 1,
          onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db
            .execute('CREATE TABLE todo (id INTEGER PRIMARY KEY, name TEXT)');
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
