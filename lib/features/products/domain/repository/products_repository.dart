import 'package:dartz/dartz.dart';
import 'package:test_alder_tech/features/products/domain/entity/products_entity.dart';

import '../../../../core/error/failure.dart';

abstract class ProductsRepository {
  Future<Either<Failure, List<ProductsEntity>>> getProducts();
  Future<Either<Failure, List<ProductsEntity>>> getProductswithoffset(
      int offset);
}
