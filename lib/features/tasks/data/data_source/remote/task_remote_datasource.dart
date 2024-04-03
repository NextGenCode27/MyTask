import 'package:my_task/core/error/exception.dart';
import 'package:my_task/features/tasks/data/models/task_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class TaskRemoteDatasource {
  Future<List<TaskModel>> addTask(TaskModel taskModel);
  Future<List<TaskModel>> fetchTask();
}

class TaskRemoteDatasourceImpl extends TaskRemoteDatasource {
  final SupabaseClient supabaseClient;

  TaskRemoteDatasourceImpl({required this.supabaseClient});
  @override
  Future<List<TaskModel>> addTask(TaskModel taskModel) async {
    try {
      final taskData = await supabaseClient
          .from('tasks')
          .insert(taskModel.toJson())
          .select();

      final List<TaskModel> taskList =
          taskData.map((e) => TaskModel.fromJson(e)).toList();
      return taskList;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<List<TaskModel>> fetchTask() async {
    try {
      final taskData = await supabaseClient
          .from('tasks')
          .select()
          .order('updated_at', ascending: false);
      final List<TaskModel> taskList =
          taskData.map((e) => TaskModel.fromJson(e)).toList();
      return taskList;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
