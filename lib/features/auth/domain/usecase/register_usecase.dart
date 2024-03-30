import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/usecase/usecase.dart';
import 'package:my_task/features/auth/domain/repository/auth_repository.dart';

class RegisterUsecas implements Usecase<String, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUsecas({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(RegisterParams params) async {
    return await authRepository.register(
      username: params.username,
      email: params.email,
      phone: params.phone,
      password: params.password,
    );
  }
}

class RegisterParams {
  final String username;
  final String email;
  final String phone;
  final String password;

  RegisterParams({
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });
}
