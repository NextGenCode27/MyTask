import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/usecase/usecase.dart';
import 'package:my_task/features/auth/domain/repository/auth_repository.dart';

class LogOutUsecase implements Usecase<dynamic, NoParams> {
  final AuthRepository authRepository;

  LogOutUsecase({required this.authRepository});
  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    return await authRepository.logOut();
  }
}
