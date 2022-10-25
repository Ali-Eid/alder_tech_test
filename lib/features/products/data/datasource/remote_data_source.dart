import 'dart:convert';

import 'package:test_alder_tech/core/constants.dart';
import 'package:test_alder_tech/core/error/exciptions.dart';
import 'package:test_alder_tech/features/products/data/model/products_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductsRemoteDataSource {
  Future<List<ProductsModel>> getProducts();
  Future<List<ProductsModel>> getProductswithoffset(int offset);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final http.Client client;

  ProductsRemoteDataSourceImpl(this.client);
  @override
  Future<List<ProductsModel>> getProducts() async {
    try {
      final response =
          await client.get(Uri.parse('${url}product/products/0'), headers: {
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json'
      });
      if (response.statusCode == 200) {
        // print(response.body);
        final jsoondecode = json.decode(response.body) as Map<String, dynamic>;
        final List listofjsons = jsoondecode['products'];
        final List<ProductsModel> jsonToproducts = listofjsons
            .map((product) => ProductsModel.fromjson(product))
            .toList();
        return jsonToproducts;
      } else {
        throw ServerExciption();
      }
    } catch (e) {
      print(e.toString());
      throw ServerExciption();
    }
  }

  @override
  Future<List<ProductsModel>> getProductswithoffset(int offset) async {
    try {
      final response = await client
          .get(Uri.parse('${url}product/products/$offset'), headers: {
        'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json'
      });
      if (response.statusCode == 200) {
        // print(response.body);
        final jsoondecode = json.decode(response.body) as Map<String, dynamic>;
        final List listofjsons = jsoondecode['products'];
        final List<ProductsModel> jsonToproducts = listofjsons
            .map((product) => ProductsModel.fromjson(product))
            .toList();
        return jsonToproducts;
      } else {
        throw ServerExciption();
      }
    } catch (e) {
      print(e.toString());
      throw ServerExciption();
    }
  }
}
