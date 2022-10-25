import 'package:dartz/dartz.dart';
import 'package:test_alder_tech/features/products/domain/repository/products_repository.dart';

import '../../../../core/error/failure.dart';
import '../entity/products_entity.dart';

class GetProductsOffsetUsecase {
  final ProductsRepository repository;

  GetProductsOffsetUsecase(this.repository);
  Future<Either<Failure, List<ProductsEntity>>> call(int offset) async {
    return await repository.getProductswithoffset(offset);
  }
}
