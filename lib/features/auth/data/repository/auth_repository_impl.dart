import 'package:test_alder_tech/features/auth/data/datasource/local_data_source.dart';
import 'package:test_alder_tech/features/auth/data/datasource/remote_data_source.dart';
import 'package:test_alder_tech/features/auth/domain/entity/user_entity.dart';
import 'package:test_alder_tech/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_alder_tech/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/constants.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);
  @override
  Future<Either<Failure, UserEntity>> loginAsGuest() async {
    try {
      final remote = await remoteDataSource.loginAsGuest();
      await localDataSource.cachedToken(remote.token);
      token = await localDataSource.getcachedToken();
      return right(remote);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getPolicy() async {
    try {
      final remote = await remoteDataSource.getPolicy();
      return right(remote);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
