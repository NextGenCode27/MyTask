import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
