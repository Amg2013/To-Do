// ignore_for_file: must_be_immutable

part of 'tasks_bloc.dart';

abstract class MainTaskState extends Equatable {
  const MainTaskState();
  @override
  List<Object> get props => [];
}

class TasksState extends MainTaskState {
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
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'DeleteTasks': deleteTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(
        map['allTasks']?.map<Task>(
          (x) => Task.fromMap(x),
        ),
      ),
      completedTasks: List<Task>.from(
        (map['completedTasks'])?.map<Task>(
          (x) => Task.fromMap(x),
        ),
      ),
      deleteTasks: List<Task>.from((map['DeleteTasks'] as List<dynamic>)
          .map<Task>((x) => Task.fromMap(x as Map<String, dynamic>))),
    );
  }

  @override
  bool get stringify => true;
}

class FoundedTasksState extends MainTaskState {
  List<Task>? loadTasksList = const TasksState().allTasks;
  late Task task;
  late String? enterdWord;
  FoundedTasksState({this.loadTasksList});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loadTasksList': loadTasksList!.map((x) => x.toMap()).toList(),
    };
  }

  factory FoundedTasksState.fromMap(Map<String, dynamic> map) {
    return FoundedTasksState(
      loadTasksList: map['loadTasksList'] != null
          ? List<Task>.from(
              (map['loadTasksList'] as List<dynamic>).map<Task?>(
                (x) => Task.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoundedTasksState.fromJson(String source) =>
      FoundedTasksState.fromMap(json.decode(source) as Map<String, dynamic>);
}
