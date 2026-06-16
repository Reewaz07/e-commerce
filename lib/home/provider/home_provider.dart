import 'package:ecommerce_app/home/model/home_model.dart';
import 'package:ecommerce_app/home/model/productModel/product_model.dart';
import 'package:ecommerce_app/home/repository/home_repository.dart';
import 'package:ecommerce_app/home/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(ref: ref);
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(ref: ref);
});

/// Fetches /home (banners, featured, deals, categories).
final homeDataProvider = FutureProvider<HomeModel>((ref) {
  return ref.read(homeRepositoryProvider).getHomeData();
});

/// Fetches /products?q=..&category=.. — pass null/null for "all".
final productListProvider =
    FutureProvider.family<ProductModel, ({String? search, String? category})>((
      ref,
      params,
    ) {
      return ref
          .read(productRepositoryProvider)
          .getProduct(search: params.search, category: params.category);
    });
