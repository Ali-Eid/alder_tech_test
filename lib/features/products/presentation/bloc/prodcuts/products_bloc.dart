import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_alder_tech/features/products/domain/entity/products_entity.dart';
import 'package:test_alder_tech/features/products/domain/usecase/get_products_offset.dart';
import 'package:test_alder_tech/features/products/domain/usecase/get_products_usecase.dart';

import '../../../../../core/constants.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUsecase getProducts;
  final GetProductsOffsetUsecase getProductsOffset;
  ProductsBloc({
    required this.getProducts,
    required this.getProductsOffset,
  }) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetProductsEvent) {
        emit(LoadingProductsState());
        final failureOrproducts = await getProducts();
        failureOrproducts.fold((error) {
          emit(ErrorProductsState(message: error.toString()));
        }, (products) {
          productsList = products;

          emit(LoadedProductsState(products: productsList));
        });
      } else if (event is GetoffsetProductsEvent) {
        // emit(Loading2ProductsState());
        final failureOrproducts = await getProductsOffset(event.offset);
        failureOrproducts.fold((error) {
          emit(ErrorProductsState(message: error.toString()));
        }, (products) {
          productsList.addAll(products);
          emit(LoadedProductsState(products: productsList));
        });
      }
    });
  }
}
