// ignore_for_file: avoid_print

import 'package:equatable/equatable.dart';

import '../../data/model/Task.dart';
import '../bloc_export.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddingTask>(_onAddTask);
    //on<ShowingTask>(_onShowingTask);
    on<DeleteingTask>(_onDeleteTask);
    on<CompleteingTasks>(_onCompletingTask);
  }

  void _onAddTask(AddingTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ),
    );
  }

  void _onCompletingTask(CompleteingTasks event, Emitter<TasksState> emit) {
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
  // void _onShowingTask(DeleteingTask event, Emitter<TasksState> emit) {
  //   final state = this.state;
  //   emit(ShowingTask(allTasks: List.from(state.allTasks)));
  // }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }

  @override
  void onChange(Change<TasksState> change) {
    print(change.currentState.allTasks.toString() +
        change.currentState.allTasks.toString());
    super.onChange(change);
  }
}
