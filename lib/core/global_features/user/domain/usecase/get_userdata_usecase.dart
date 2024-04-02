import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/usecase/usecase.dart';
import 'package:my_task/core/global_features/user/domain/entity/user_entity.dart';
import 'package:my_task/core/global_features/user/domain/repository/user_repository.dart';

class GetCurrentUserDataUsecase implements Usecase<UserEntity, NoParams> {
  final UserRepository userRepository;

  GetCurrentUserDataUsecase({required this.userRepository});
  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await userRepository.getCurrentUserData();
  }
}
