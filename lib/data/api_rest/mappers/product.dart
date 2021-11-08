import 'package:offline_app/domain/entity/product.dart';
import 'package:offline_app/domain/models/mapper.dart';

class ApiRestProductMapper extends Mapper<Product> {
  @override
  Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: ApiRestProductRatingMapper().fromJson(
        json['rating'],
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(Product data) {
    return {
      "id": data.id,
      "title": data.title,
      "price": data.price,
      "description": data.description,
      "category": data.category,
      "image": data.image,
      "rating": ApiRestProductRatingMapper().toJson(data.rating),
    };
  }
}

class ApiRestProductRatingMapper extends Mapper<Rating> {
  @override
  Rating fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }

  @override
  Map<String, dynamic> toJson(Rating data) {
    return {
      "rate": data.rate,
      "count": data.count,
    };
  }
}
