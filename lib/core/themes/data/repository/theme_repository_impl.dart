import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:my_task/core/error/exception.dart';
import 'package:my_task/core/themes/data/data_source/local/theme_local_datasource.dart';
import 'package:my_task/core/themes/domain/repository/them_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDatasource themeLocalDatasource;
  ThemeRepositoryImpl(this.themeLocalDatasource);
  @override
  Future<Either<Failure, ThemeData>> toggleTheme() async {
    try {
      final isDarkTheme = await themeLocalDatasource.toggleTheme();
      return right(isDarkTheme);
    } on ServerException catch (e) {
      return left(
        Failure(message: e.message),
      );
    }
  }

  @override
  Future<Either<Failure, ThemeData>> getTheme() async {
    try {
      final isDarkTheme = await themeLocalDatasource.getTheme();
      return right(isDarkTheme);
    } on ServerException catch (e) {
      return left(
        Failure(message: e.message),
      );
    }
  }
}
