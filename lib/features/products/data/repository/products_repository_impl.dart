import 'package:test_alder_tech/features/products/data/datasource/remote_data_source.dart';
import 'package:test_alder_tech/features/products/domain/entity/products_entity.dart';
import 'package:test_alder_tech/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:test_alder_tech/features/products/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<ProductsEntity>>> getProducts() async {
    try {
      final remote = await remoteDataSource.getProducts();
      return right(remote);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> getProductswithoffset(
      int offset) async {
    try {
      final remote = await remoteDataSource.getProductswithoffset(offset);
      return right(remote);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
