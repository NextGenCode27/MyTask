part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {
  @override
  String toString() => 'Task Event';
}

final class AddTaskEvent extends TaskEvent {
  final AddTaskParams addTaskParams;

  AddTaskEvent({required this.addTaskParams});
  @override
  String toString() => 'Add Task Event';
}

final class FetchTaskEvent extends TaskEvent {
  @override
  String toString() => 'Fetch Task Event';
}

final class FetchCurrentUserTaskEvent extends TaskEvent {
  @override
  String toString() => 'Fetch Current User Task Event';
}
