part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();
  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({required this.task});

  @override
  List<Object> get props => [task];
}

class CompleteTasks extends TasksEvent {
  final Task task;

  const CompleteTasks({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteingTask extends TasksEvent {
  final Task task;

  const DeleteingTask({required this.task});

  @override
  List<Object> get props => [task];
}

class SearchOnTasksList extends TasksEvent {
  final List<Task> allLoadedTasks;
  final Task task;
  const SearchOnTasksList(this.task, {required this.allLoadedTasks});

  @override
  List<Object> get props => [allLoadedTasks];
}
