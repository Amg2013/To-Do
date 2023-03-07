// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../../data/model/Task.dart';
import '../bloc_export.dart';
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

// void _onSearshing(SearchOnTasksList event, Emitter<FoundedTasksState> emit) {
//   final state = this.Founded;
//   final task = event.task;
//   late List<Task> results = [];
//   emit(FoundedTasksState(loadTasksList: List.from(state.allTasks)));
//}

// FutureOr<void> _onMarkFavoriteOrUnFavoriteTask(
//     MarkFavoriteOrUnFavoriteTask event, Emitter<TasksState> emit) {
//   final state = this.state;
//   List<Task> pendingTasks = state.pendingTasks;
//   List<Task> completedTasks = state.completedTasks;
//   List<Task> favoriteTasks = state.favoriteTasks;
//   if (event.task.isDone == false) {
//     if (event.task.isFavorite == false) {
//       var taskIndex = pendingTasks.indexOf(event.task);
//       pendingTasks = List.from(pendingTasks)
//         ..remove(event.task)
//         ..insert(taskIndex, event.task.copyWith(isFavorite: true));
//       favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
//     } else {
//       var taskIndex = pendingTasks.indexOf(event.task);
//       pendingTasks = List.from(pendingTasks)
//         ..remove(event.task)
//         ..insert(taskIndex, event.task.copyWith(isFavorite: false));
//       favoriteTasks.remove(event.task);
//     }
//   } else {
//     if (event.task.isFavorite == false) {
//       var taskIndex = completedTasks.indexOf(event.task);
//       completedTasks = List.from(completedTasks)
//         ..remove(event.task)
//         ..insert(taskIndex, event.task.copyWith(isFavorite: true));
//       favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
//     } else {
//       var taskIndex = completedTasks.indexOf(event.task);
//       completedTasks = List.from(completedTasks)
//         ..remove(event.task)
//         ..insert(taskIndex, event.task.copyWith(isFavorite: false));
//       favoriteTasks.remove(event.task);
//     }
//   }
//   emit(TasksState(
//     pendingTasks: pendingTasks,
//     completedTasks: completedTasks,
//     favoriteTasks: favoriteTasks,
//     removedTasks: state.removedTasks,
//   ));
// }
