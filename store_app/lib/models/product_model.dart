import 'package:store_app/models/rating_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final dynamic price;
  final String image;
  final String category;
  final RatingModel? rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.rating,
  });
  factory ProductModel.fromJson(jsondata) {
    return ProductModel(
      id: jsondata["id"],
      title: jsondata["title"],
      description: jsondata["description"],
      price: jsondata["price"],
      image: jsondata["image"],
      category: jsondata["category"],
      rating: jsondata['rating'] == null
          ? null
          : RatingModel.fromJson(jsondata['rating']),
    );
  }
}
