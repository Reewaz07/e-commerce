import 'dart:async';

import 'package:ecommerce_app/home/model/productModel/product_model.dart';
import 'package:ecommerce_app/home/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider = FutureProvider<ProductModel>((ref) async {
  final repo = ProductRepository(ref: ref).getProduct();
  return repo;
});

class ProductNotifier extends AsyncNotifier<ProductModel> {
  @override
  FutureOr<ProductModel> build() {
    final repo = ProductRepository(ref: ref).getProduct();
    return repo;
  }

  void search(String query) async {
    state = AsyncLoading();
    final response = await ProductRepository(
      ref: ref,
    ).getProduct(search: query);
    state = AsyncData(response);
  }
}

final productNotifierProvider =
    AsyncNotifierProvider<ProductNotifier, ProductModel>(
      () => ProductNotifier(),
    );
