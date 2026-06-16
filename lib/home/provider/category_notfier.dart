import 'dart:async';

import 'package:ecommerce_app/home/model/category_model.dart';
import 'package:ecommerce_app/home/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryNotfier extends AsyncNotifier<List<CategoryModel>> {
  @override
  Future<List<CategoryModel>> build() {
    final repository = ProductRepository(ref: ref).fetchCategotyData();

    return repository;
  }
}

final categoryNotifierProvider =
    AsyncNotifierProvider<CategoryNotfier, List<CategoryModel>>(
      () => CategoryNotfier(),
    );
