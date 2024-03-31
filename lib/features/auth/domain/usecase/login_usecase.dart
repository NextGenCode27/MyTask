import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/usecase/usecase.dart';
import 'package:my_task/features/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginUsecase implements Usecase<User?, LoginParams> {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});
  @override
  Future<Either<Failure, User?>> call(LoginParams params) async {
    return await authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
