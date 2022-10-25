import 'package:dartz/dartz.dart';
import 'package:test_alder_tech/features/products/domain/repository/products_repository.dart';

import '../../../../core/error/failure.dart';
import '../entity/products_entity.dart';

class GetProductsUsecase {
  final ProductsRepository repository;

  GetProductsUsecase(this.repository);
  Future<Either<Failure, List<ProductsEntity>>> call() async {
    return await repository.getProducts();
  }
}
