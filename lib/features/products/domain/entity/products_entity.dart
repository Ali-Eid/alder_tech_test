import 'package:equatable/equatable.dart';

class ProductsEntity extends Equatable {
  final int id;
  final String name;
  final int category_id;
  final int unit_id;
  final int brand_id;
  final String image_url;
  final String product_brand;
  final int cate_parent_id;

  const ProductsEntity(this.id, this.name, this.category_id, this.unit_id,
      this.brand_id, this.image_url, this.product_brand, this.cate_parent_id);
  @override
  List<Object?> get props => [
        id,
        name,
        category_id,
        unit_id,
        brand_id,
        image_url,
        product_brand,
        cate_parent_id
      ];
}
