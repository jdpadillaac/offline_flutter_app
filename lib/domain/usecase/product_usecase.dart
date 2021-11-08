import 'package:dartz/dartz.dart';
import 'package:offline_app/domain/entity/product.dart';
import 'package:offline_app/domain/helpers/internet.dart';
import 'package:offline_app/domain/repository/product.dart';

class ProductUseCase {
  const ProductUseCase({
    required ProductRepository remoteRepository,
    required LocalProductRepository localRepository,
  })  : _localRepository = localRepository,
        _productRepository = remoteRepository;

  final ProductRepository _productRepository;
  final LocalProductRepository _localRepository;

  Future<Either<String, List<Product>>> getCompleteList() async {
    List<Product> productList = [];
    try {
      final internetEnabled = await AppInternet.hasNetwork();

      if (internetEnabled) {
        productList = await _productRepository.getCompleteList();
        await _localRepository.clearCompleteDb();
        _localRepository.saveList(productList);
      } else {
        productList = await _localRepository.getCompleteList();
      }

      return Right(productList);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
