import 'dart:async';

import 'package:ecommerce_app/home/model/list_of_models.dart';
import 'package:ecommerce_app/home/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProductNotifier extends AsyncNotifier<Featured?> {
  @override
  FutureOr<Featured?> build() {
    return null;
  }

  Future<void> addProduct({required AddProdct product}) async {
    state = AsyncLoading();
    final respository = await ProductRepository(
      ref: ref,
    ).addProduct(product: product);
    
  }
}

class AddProdct {
  final Sstring name;
  final Sstring name;
  final Sstring name;
  final Sstring name;
  final Sstring name;
}
