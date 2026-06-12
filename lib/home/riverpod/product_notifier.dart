import 'dart:async';

import 'package:ecommerce_app/home/model/productModel/product_model.dart';
import 'package:ecommerce_app/home/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends AsyncNotifier<ProductModel> {
  @override
  FutureOr<ProductModel> build() {
    final repo = ProductRepository(ref: ref).getProduct();
    return repo;
  }
}

final productNotifierProvider =
    AsyncNotifierProvider<ProductNotifier, ProductModel>(
      () => ProductNotifier(),
    );
