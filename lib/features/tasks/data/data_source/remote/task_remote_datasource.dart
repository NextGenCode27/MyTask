import 'package:my_task/core/error/exception.dart';
import 'package:my_task/features/tasks/data/models/task_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class TaskRemoteDatasource {
  Future<TaskModel> addTask(TaskModel taskModel);
}

class TaskRemoteDatasourceImpl extends TaskRemoteDatasource {
  final SupabaseClient supabaseClient;

  TaskRemoteDatasourceImpl({required this.supabaseClient});
  @override
  Future<TaskModel> addTask(TaskModel taskModel) async {
    try {
      final taskData = await supabaseClient
          .from('tasks')
          .insert(taskModel.toJson())
          .select();

      return TaskModel.fromJson(taskData.first);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
