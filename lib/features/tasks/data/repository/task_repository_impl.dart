import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/error/exception.dart';
import 'package:my_task/features/tasks/data/data_source/remote/task_remote_datasource.dart';
import 'package:my_task/features/tasks/data/models/task_model.dart';
import 'package:my_task/features/tasks/domain/enitity/task_entity.dart';
import 'package:my_task/features/tasks/domain/repository/task_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDatasource taskRemoteDatasource;
  final SupabaseClient supabaseClient;

  TaskRepositoryImpl({
    required this.taskRemoteDatasource,
    required this.supabaseClient,
  });
  @override
  Future<Either<Failure, List<TaskEntity>>> addTask({
    required String username,
    required String location,
    required String department,
    required String problemReported,
    required String assignTo,
  }) async {
    try {
      final newTask = await taskRemoteDatasource.addTask(
        TaskModel(
          id: const Uuid().v4(),
          userId: supabaseClient.auth.currentUser!.id,
          username: username,
          location: location,
          department: department,
          problemReported: problemReported,
          assignTo: assignTo,
          isCompleted: false,
          updatedAt: DateTime.now(),
        ),
      );
      return right(newTask);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> fetchTaskList() async {
    try {
      final taskList = await taskRemoteDatasource.fetchTask();
      return right(taskList);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> fetchCurrentUserTaskList() async {
    try {
      final taskList = await taskRemoteDatasource.fetchCurrentUserTask();
      return right(taskList);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
