part of 'task_bloc.dart';

@immutable
sealed class TaskState {
  @override
  String toString() => 'Task State';
}

final class TaskInitial extends TaskState {
  @override
  String toString() => 'Task Initial';
}

final class TaskLoading extends TaskState {
  @override
  String toString() => 'Task Loading';
}

final class TaskAddSuccess extends TaskState {
  TaskAddSuccess();
  @override
  String toString() => 'Task Add Success';
}

final class TaskFailed extends TaskState {
  final String message;

  TaskFailed({required this.message});
  @override
  String toString() => 'Task Failed';
}
