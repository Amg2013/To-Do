// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'data_base_bloc.dart';

abstract class DataBaseState {
  final List<Task>? allTasks;
  final List<Task>? doneTasks;

  DataBaseState({this.doneTasks, this.allTasks = const <Task>[]});
}

class DataBaseInitial extends DataBaseState {}

class InsertToDB extends DataBaseState {}

class LoadedDateBase extends DataBaseState {}

class DeletedTasks extends DataBaseState {}

class SecrchTask extends DataBaseState {}
