import 'dart:async';

import 'package:ecommerce_app/home/model/list_of_models.dart';
import 'package:ecommerce_app/home/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailNotifier extends AsyncNotifier<Featured> {
  final ProductFilter data;

  ProductDetailNotifier({required this.data});

  @override
  FutureOr<Featured> build() async {
    final repository = ProductRepository(ref: ref).getProductDeatil(data.id);

    return repository;
  }
}

final productDetailProvider =
    AsyncNotifierProvider.family<
      ProductDetailNotifier,
      Featured,
      ProductFilter
    >((data) => ProductDetailNotifier(data: data));

class ProductFilter {
  final String id;
  final String? short;
  final String? dd;

  ProductFilter({required this.id, this.short, this.dd});
}
