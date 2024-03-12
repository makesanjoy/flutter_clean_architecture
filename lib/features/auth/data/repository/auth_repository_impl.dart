import 'package:flutter_clean_architecture/core/error/exception.dart';
import 'package:flutter_clean_architecture/core/error/failures.dart';
import 'package:flutter_clean_architecture/features/auth/data/dataSources/auth_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signIn(email: email, password: password);
      return right(userId);
    } on CustomException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUp({required String name, required String email, required String password}) async {
    try {
      final userId = await remoteDataSource.signUp(
        name: name,
        email: email,
        password: password,
      );

      ///this [right] is coming from fpdart package
      return right(userId);
    } on CustomException catch (e) {
      return left(Failure(e.message));
    }
  }
}
