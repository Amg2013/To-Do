import 'package:sqflite/sqflite.dart';

class SqlDb {
  intDb() async {
    String databaspath = await getDatabasesPath();

    Database db = await openDatabase(
      databaspath,
      onCreate: (_onCreat),
    );
  }

  _onCreat(Database db, int version) async {
    await db.execute('''

''');
  }
}
//  void createDataBase() {
//     openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database, version) {
//         print('database created');
//         database
//             .execute(
//                 'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
//             .then((value) {
//           print('table created');
//         }).catchError((error) {
//           print('Error When Creating Table ${error.toString()}');
//         });
//       },
//       onOpen: (database) {
//         getDataBase(database);
//         print('database opened');
//       },
//     ).then((value) {
//       database = value;
//     });
//   }

//   insertToDatabase({
//     required String title,
//     required String time,
//     required String date,
//   }) async {
//     await database!.transaction((txn) {
//      return txn
//           .rawInsert(
//         'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
//       )
//           .then((value) {
//         print('$value inserted successfully');
//         emit(AppInsertDatabaseState());
//         getDataBase(database);
//       }).catchError((error) {
//         print('Error When Inserting New Record ${error.toString()}');
//       });

//     });
//   }

//   void getDataBase(database) {
//     newTasks = [];
//     doneTasks = [];
//     archivedTasks = [];
//     emit(AppGetDatabaseLoadingState());
//     database.rawQuery('SELECT * FROM tasks').then((value) {
//       value.forEach((element) {
//         if (element['status'] == 'new')
//           newTasks.add(element);
//         else if (element['status'] == 'done')
//           doneTasks.add(element);
//         else
//           archivedTasks.add(element);
//       });
//       emit(AppGetDatabaseState());
//     });
//   }

//   void updateData({
//     required String status,
//     required int id,
//   }) async {
//     database!.rawUpdate(
//       'UPDATE tasks SET status = ? WHERE id = ?',
//       ['$status', id],
//     ).then((value) {
//       getDataBase(database);
//       );
//     });
//   }

//   void deleteData({
//     required int id,
//   }) async {
//     database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
//       getDataBase(database);
//       emit(AppDeleteDatabaseState());
//     });
//   }


