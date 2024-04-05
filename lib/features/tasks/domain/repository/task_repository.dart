import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/features/tasks/domain/enitity/task_entity.dart';

abstract interface class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> addTask({
    required String username,
    required String location,
    required String department,
    required String problemReported,
    required String assignTo,
  });

  Future<Either<Failure, List<TaskEntity>>> fetchTaskList();
  Future<Either<Failure, List<TaskEntity>>> fetchCurrentUserTaskList();
}
