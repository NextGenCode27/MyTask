import 'package:fpdart/fpdart.dart';
import 'package:my_task/core/error/error.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User?>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User?>> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  });
  Future<Either<Failure, dynamic>> logOut();
}
