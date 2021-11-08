import 'package:offline_app/domain/entity/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getCompleteList();
}

abstract class LocalProductRepository {
  Future<List<Product>> getCompleteList();
  Future<void> saveList(List<Product> products);
  Future<void> clearCompleteDb();
}
