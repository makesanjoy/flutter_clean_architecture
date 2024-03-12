import 'package:supabase/supabase.dart';

import '../../../../core/error/exception.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<String> signIn({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<String> signUp({required String name, required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(password: password, email: email, data: {'name': name});
      if (response.user == null) {
       throw CustomException('User is null');
      }
      return response.user?.id ?? "";
    } catch (e) {
     throw CustomException(e.toString());
    }
  }

  @override
  Future<String>? signIn({required String email, required String password}) {
    return null;
  }
}
