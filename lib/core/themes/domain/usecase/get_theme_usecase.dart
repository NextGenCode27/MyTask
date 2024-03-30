import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/themes/domain/repository/them_repository.dart';
import 'package:my_task/core/usecase/usecase.dart';

class GetThemeUsecase implements Usecase<ThemeData, NoParams> {
  final ThemeRepository themeRepository;
  GetThemeUsecase(this.themeRepository);
  @override
  Future<Either<Failure, ThemeData>> call(NoParams params) async {
    return await themeRepository.getTheme();
  }
}
