import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/error/exception.dart';
import 'package:my_task/core/user/data/data_source/remote/user_remote_datasource.dart';
import 'package:my_task/core/user/domain/entity/user_entity.dart';
import 'package:my_task/core/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource userRemoteDatasource;

  UserRepositoryImpl({required this.userRemoteDatasource});
  @override
  Future<Either<Failure, UserEntity>> getCurrentUserData() async {
    try {
      final userData = await userRemoteDatasource.getCurrentUserData();

      return right(userData);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
