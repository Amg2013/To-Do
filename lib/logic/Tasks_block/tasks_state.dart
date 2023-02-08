// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> completedTasks;
  final List<Task> deleteTasks;

  const TasksState({
    this.allTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.deleteTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks, completedTasks, deleteTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      // 'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      // 'DeleteTasks': deleteTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(
        (map['allTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      // completedTasks: List<Task>.from(
      //   (map['completedTasks'] as List<int>).map<Task>(
      //     (x) => Task.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
      // deleteTasks: List<Task>.from(
      //   (map['DeleteTasks'] as List<int>).map<Task>(
      //     (x) => Task.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TasksState.fromJson(String source) =>
      TasksState.fromMap(json.decode(source) as Map<String, dynamic>);
}

void creatDataBase() async {
  openDatabase(
    'tasks.db',
    version: 1,
    onCreate: (db, version) async {
      print('data is created');
      db
          .execute('CREAT TABEL tasks (id TEXT PRIMARY KAY, title  TEXT)')
          .then((value) {
        print('tabel created');
      }).catchError((error) {
        print('Error ${error.toString()}');
      });
    },
  );
}
