import 'package:dartz/dartz.dart';
import 'package:test_alder_tech/features/auth/domain/entity/user_entity.dart';

import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginAsGuest();
  Future<Either<Failure, String>> getPolicy();
}
