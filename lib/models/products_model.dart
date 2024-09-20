import 'package:flutter/material.dart';
import 'package:store_app/models/rating_model.dart';

class ProductsModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String image;
  final RatingModel ratingModel;
  final String category;

  ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.ratingModel,
       required this.category
      });

  factory ProductsModel.fromJson(json) {
    return ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        category: json['category'],
        description: json["description"],
        image: json["image"],
       ratingModel: RatingModel.fromjson(json['rating'])
        
        );
  }
}
