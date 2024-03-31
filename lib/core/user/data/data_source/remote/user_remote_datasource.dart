import 'package:my_task/core/error/exception.dart';
import 'package:my_task/core/user/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class UserRemoteDatasource {
  Future<UserModel> getCurrentUserData();
}

class UserRemoteDatasourceImpl extends UserRemoteDatasource {
  final SupabaseClient supabaseClient;

  UserRemoteDatasourceImpl({required this.supabaseClient});
  @override
  Future<UserModel> getCurrentUserData() async {
    try {
      final userData = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', supabaseClient.auth.currentUser!.id);

      return UserModel.fromJson(userData.first);
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}
