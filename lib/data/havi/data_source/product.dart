import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:offline_app/data/api_rest/mappers/product.dart';
import 'package:offline_app/domain/entity/product.dart';
import 'package:offline_app/domain/errors/repository.dart';
import 'package:offline_app/domain/repository/product.dart';

class HaviProduct extends LocalProductRepository {
  final ApiRestProductMapper _productMapper = ApiRestProductMapper();

  Future<Box<dynamic>> dbCnn() async {
    return await Hive.openBox('product');
  }

  @override
  Future<List<Product>> getCompleteList() async {
    final _box = await dbCnn();

    try {
      List<Product> productList = [];

      for (var item in _box.values) {
        final mapItem = json.decode(item);
        mapItem['image'] = '';
        final product = _productMapper.fromJson(mapItem);
        productList.add(product);
      }

      return productList;
    } catch (e) {
      throw RepositoryExeption(
        reason: e.toString(),
        statucCode: 0,
      );
    }
  }

  @override
  Future<void> saveList(List<Product> products) async {
    final _box = await dbCnn();

    try {
      for (final item in products) {
        final mapProduct = _productMapper.toJson(item);
        final productString = json.encode(mapProduct);
        _box.put(item.id, productString);
      }

      return;
    } catch (e) {
      throw RepositoryExeption(
        reason: e.toString(),
        statucCode: 0,
      );
    }
  }

  @override
  Future<void> clearCompleteDb() async {
    final box = await dbCnn();
    box.clear();
  }
}
