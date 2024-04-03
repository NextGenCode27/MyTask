part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {
  @override
  String toString() => 'Task Event';
}

final class AddTaskEvent extends TaskEvent {
  final AddTaskParams addTaskParams;

  AddTaskEvent({required this.addTaskParams});
}

final class FetchTaskEvent extends TaskEvent {}
