import 'package:flutter/material.dart';
import 'package:mvvm_provider_dio/viewmodels/product_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productViewModel =
        Provider.of<ProductViewModel>(context, listen: false);

    productViewModel.loadProducts();

    return Consumer<ProductViewModel>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(provider.products[index].name.toString()),
              subtitle: Text(provider.products[index].description.toString()),
              trailing: Text(provider.products[index].price.toString()),
            );
          },
        );
      },
    );
  }
}
