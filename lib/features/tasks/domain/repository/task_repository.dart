import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';

abstract interface class TaskRepository {
  Future<Either<Failure, void>> addTask({
    required String username,
    required String location,
    required String department,
    required String problemReported,
    required String assignTo,
  });
}
