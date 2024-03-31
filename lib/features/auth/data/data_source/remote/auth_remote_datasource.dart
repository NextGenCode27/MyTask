import 'package:my_task/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Future<User?> login({
    required String email,
    required String password,
  });
  Future<User?> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  });

  Future<dynamic> logOut();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabaseClient;

  AuthRemoteDatasourceImpl({required this.supabaseClient});

  @override
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      return user;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<User?> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': username,
        'phone': phone,
      },
    );
    final user = response.user;
    return user;
  }

  @override
  Future<dynamic> logOut() async {
    try {
      final response = await supabaseClient.auth.signOut();
      return response;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
