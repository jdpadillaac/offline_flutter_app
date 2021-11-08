import 'package:dio/dio.dart';
import 'package:offline_app/data/api_rest/mappers/product.dart';
import 'package:offline_app/domain/entity/product.dart';
import 'package:offline_app/domain/errors/repository.dart';
import 'package:offline_app/domain/repository/product.dart';

class ProductApi extends ProductRepository {
  final ApiRestProductMapper _productMapper = ApiRestProductMapper();
  final Dio _dio = Dio();

  @override
  Future<List<Product>> getCompleteList() async {
    const url = 'https://fakestoreapi.com/products';
    try {
      final response = await _dio.get(url);

      if (response.statusCode! != 200) {
        throw RepositoryExeption(
          reason: response.data,
          statucCode: response.statusCode!,
        );
      }

      final List<dynamic> data = response.data;
      final productList = data.map((e) => _productMapper.fromJson(e)).toList();
      return productList;
    } catch (e) {
      throw RepositoryExeption(
        reason: e.toString(),
        statucCode: 0,
        platform: 'local',
      );
    }
  }
}
