part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> completedTasks;
  final List<Task> DeleteTasks;

  const TasksState({
    this.allTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.DeleteTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        allTasks,
        completedTasks,
        DeleteTasks,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //  'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'DeleteTasks': DeleteTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      //'favoriteTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      // 'removedTasks': pendingTasks.map((x) => x.toMap()).toList(),
    };
  }
}
