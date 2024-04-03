import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/usecase/usecase.dart';
import 'package:my_task/features/tasks/domain/enitity/task_entity.dart';
import 'package:my_task/features/tasks/domain/repository/task_repository.dart';

class FetchTaskUsecase implements Usecase<List<TaskEntity>, NoParams> {
  final TaskRepository taskRepository;

  FetchTaskUsecase({required this.taskRepository});
  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) async {
    return await taskRepository.fetchTaskList();
  }
}
