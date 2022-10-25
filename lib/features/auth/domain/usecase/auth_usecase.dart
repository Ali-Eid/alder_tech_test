import 'package:dartz/dartz.dart';
import 'package:test_alder_tech/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/failure.dart';
import '../entity/user_entity.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);
  Future<Either<Failure, UserEntity>> call() async {
    return await repository.loginAsGuest();
  }
}
