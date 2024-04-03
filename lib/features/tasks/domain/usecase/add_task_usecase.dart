import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/usecase/usecase.dart';
import 'package:my_task/features/tasks/domain/enitity/task_entity.dart';
import 'package:my_task/features/tasks/domain/repository/task_repository.dart';

class AddTaskUsecase implements Usecase<List<TaskEntity>, AddTaskParams> {
  final TaskRepository taskRepository;

  AddTaskUsecase({required this.taskRepository});
  @override
  Future<Either<Failure, List<TaskEntity>>> call(AddTaskParams params) async {
    return await taskRepository.addTask(
      username: params.username,
      location: params.location,
      department: params.department,
      problemReported: params.problemReported,
      assignTo: params.assignTo,
    );
  }
}

class AddTaskParams {
  final String username;
  final String location;
  final String department;
  final String problemReported;
  final String assignTo;

  AddTaskParams({
    required this.username,
    required this.location,
    required this.department,
    required this.problemReported,
    required this.assignTo,
  });
}
