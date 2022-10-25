import 'package:flutter/material.dart';

import '../features/products/domain/entity/products_entity.dart';

const String url = 'http://e-soaq.aldrtest.sy/api/';
const String urlImage = 'http://e-soaq.aldrtest.sy/';
String? token;
ScrollController controller = ScrollController();
List<ProductsEntity> productsList = [];
