import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvvm_provider_dio/models/product_model.dart';

class ProductAPIService {
  // Firestore instance
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection("product");

  Future getProducts() async {
    final snapshot = await _productsCollection.get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
