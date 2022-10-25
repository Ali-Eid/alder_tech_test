import 'package:test_alder_tech/features/products/domain/entity/products_entity.dart';

class ProductsModel extends ProductsEntity {
  const ProductsModel(
      super.id,
      super.name,
      super.category_id,
      super.unit_id,
      super.brand_id,
      super.image_url,
      super.product_brand,
      super.cate_parent_id);
  factory ProductsModel.fromjson(Map<String, dynamic> json) {
    return ProductsModel(
        json['id'],
        json['name'],
        json['category_id'],
        json['unit_id'],
        json['brand_id'],
        json['image_url'],
        json['product_brand'],
        json['cate_parent_id']);
  }
}
