import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/user/domain/entity/user_entity.dart';

abstract interface class UserRepository {
  Future<Either<Failure, UserEntity>> getCurrentUserData();
}
