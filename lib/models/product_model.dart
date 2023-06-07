// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String? description;
  String? name;
  int? price;

  ProductModel({
    this.description,
    this.name,
    this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        description: json["description"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "name": name,
        "price": price,
      };
}
