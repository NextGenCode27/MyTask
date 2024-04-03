import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/usecase/usecase.dart';
import 'package:my_task/features/tasks/domain/enitity/task_entity.dart';
import 'package:my_task/features/tasks/domain/usecase/add_task_usecase.dart';
import 'package:my_task/features/tasks/domain/usecase/fetch_task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTaskUsecase _addTaskUsecase;
  final FetchTaskUsecase _fetchTaskUsecase;
  TaskBloc({
    required AddTaskUsecase addTaskUsecase,
    required FetchTaskUsecase fetchTaskUsecase,
  })  : _addTaskUsecase = addTaskUsecase,
        _fetchTaskUsecase = fetchTaskUsecase,
        super(TaskInitial()) {
    on<TaskEvent>(_mapTaskEventToState);
    on<AddTaskEvent>(_mapAddTaskEventToState);
    on<FetchTaskEvent>(_mapFetchTaskEventToMap);
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
      (newTask) => emit(TaskSuccess(taskEntity: newTask)),
    );
  }

  FutureOr<void> _mapFetchTaskEventToMap(
      FetchTaskEvent event, Emitter<TaskState> emit) async {
    final res = await _fetchTaskUsecase.call(NoParams());
    res.fold(
      (error) => emit(TaskFailed(message: error.message)),
      (taskList) {
        emit(TaskSuccess(taskEntity: taskList));
      },
    );
  }
}
