import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/dioProvider/dio_provider.dart';
import 'package:ecommerce_app/home/model/productModel/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductRepository {
  final Ref ref;
  ProductRepository({required this.ref});

  Dio get _dio => ref.read(dioProvdier);
  Future<ProductModel> getProduct({String? search, String? category}) async {
    final response = await _dio.get("/products?q=$search&category=$category");
    return ProductModel.fromJson(response.data);
  }

  Future<void> addToWishList(String productId) async {
    await _dio.post('/wishlist/$productId', data: {'name': productName});
  }
}
