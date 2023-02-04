import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/Task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
    on<completedTasks>(_onUpdateTask);
  }
  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
        TasksState(DeleteTasks: List.from(state.DeleteTasks)..add(event.task)));
  }

  void _onUpdateTask(completedTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(DeleteTasks: List.from(state.allTasks)..add(event.task)));
  }
}
