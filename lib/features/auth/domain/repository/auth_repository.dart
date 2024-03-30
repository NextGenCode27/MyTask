import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  });
}
