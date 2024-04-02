import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/features/tasks/domain/usecase/add_task_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTaskUsecase _addTaskUsecase;
  TaskBloc({required AddTaskUsecase addTaskUsecase})
      : _addTaskUsecase = addTaskUsecase,
        super(TaskInitial()) {
    on<TaskEvent>(_mapTaskEventToState);
    on<AddTaskEvent>(_mapAddTaskEventToState);
  }
  FutureOr<void> _mapTaskEventToState(
      TaskEvent event, Emitter<TaskState> emit) {
    emit(TaskLoading());
  }

  FutureOr<void> _mapAddTaskEventToState(
      AddTaskEvent event, Emitter<TaskState> emit) async {
    final res = await _addTaskUsecase.call(
      AddTaskParams(
        username: event.addTaskParams.username,
        location: event.addTaskParams.location,
        department: event.addTaskParams.department,
        problemReported: event.addTaskParams.problemReported,
        assignTo: event.addTaskParams.assignTo,
      ),
    );

    res.fold(
      (error) => emit(TaskFailed(message: error.message)),
      (newTask) => emit(TaskAddSuccess()),
    );
  }
}
