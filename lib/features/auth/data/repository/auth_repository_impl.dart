import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/error/exception.dart';
import 'package:my_task/features/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:my_task/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final userId = await authRemoteDatasource.login(
        email: email,
        password: password,
      );
      return right(userId);
    } on AuthException catch (e) {
      return left(Failure(message: e.message));
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final userId = await authRemoteDatasource.register(
        username: username,
        email: email,
        phone: phone,
        password: password,
      );
      return right(userId);
    } on AuthException catch (e) {
      return left(Failure(message: e.message));
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
