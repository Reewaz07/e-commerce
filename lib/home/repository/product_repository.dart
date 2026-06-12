import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/dioProvider/dio_provider.dart';
import 'package:ecommerce_app/home/model/productModel/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductRepository {
  final Ref ref;
  ProductRepository({required this.ref});

  Dio get _dio => ref.read(dioProvdier);
  Future<ProductModel> getProduct() async {
    final response = await _dio.get("/products");
    return ProductModel.fromJson(response.data);
  }
}
