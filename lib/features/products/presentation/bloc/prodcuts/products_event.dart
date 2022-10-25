part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProductsEvent {}

class GetoffsetProductsEvent extends ProductsEvent {
  final int offset;

  const GetoffsetProductsEvent(this.offset);
}
