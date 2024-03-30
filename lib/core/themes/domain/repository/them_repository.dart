import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';

abstract interface class ThemeRepository {
  Future<Either<Failure, ThemeData>> toggleTheme();

  Future<Either<Failure, ThemeData>> getTheme();
}
