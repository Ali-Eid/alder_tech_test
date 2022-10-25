import 'package:dartz/dartz.dart';
import 'package:test_alder_tech/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/failure.dart';

class GetPolicyUseCase {
  final AuthRepository repository;

  GetPolicyUseCase(this.repository);
  Future<Either<Failure, String>> call() async {
    return await repository.getPolicy();
  }
}
