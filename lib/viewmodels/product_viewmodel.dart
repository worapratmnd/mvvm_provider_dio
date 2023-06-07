import 'package:flutter/material.dart';
import 'package:mvvm_provider_dio/models/product_model.dart';
import 'package:mvvm_provider_dio/services/product_api_service.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductAPIService _productAPIService = ProductAPIService();

  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  Future<void> loadProducts() async {
    _products = await _productAPIService.getProducts();
    notifyListeners();
  }
}
