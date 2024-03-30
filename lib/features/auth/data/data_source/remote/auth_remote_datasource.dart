import 'package:my_task/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasource {
  Future<String> login({
    required String email,
    required String password,
  });

  Future<String> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final SupabaseClient supabaseClient;
  AuthRemoteDatasourceImpl(this.supabaseClient);
  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final response =
          await supabaseClient.auth.signInWithPassword(password: password);
      if (response.user == null) {
        throw ServerException(message: 'No user found');
      }

      return response.user!.id;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<String> register({
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    // TODO: implement register
    throw UnimplementedError();
  }
}
