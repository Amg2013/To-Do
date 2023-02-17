// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddingTask extends TasksEvent {
  final Task task;

  const AddingTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class CompleteingTasks extends TasksEvent {
  final Task task;

  const CompleteingTasks({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteingTask extends TasksEvent {
  final Task task;

  const DeleteingTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class ShowingTask extends TasksEvent {
  final List<Task> allLoadedTasks;
  const ShowingTask({
    required this.allLoadedTasks,
  });

  @override
  List<Object> get props => [allLoadedTasks];
}
