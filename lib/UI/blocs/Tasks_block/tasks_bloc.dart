// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../../../data/model/Task.dart';
import '../Bloc_export.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> with HydratedMixin {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    //   on<SearchOnTasksList>(_onSearshing);
    on<DeleteingTask>(_onDeleteTask);
    on<CompleteTasks>(_onCompletingTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        completedTasks: state.completedTasks,
        deleteTasks: state.deleteTasks,
        allTasks: List.from(state.allTasks)..add(event.task)));
  }

  void _onCompletingTask(CompleteTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));
    emit(TasksState(allTasks: allTasks));
  }

  void _onDeleteTask(DeleteingTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
