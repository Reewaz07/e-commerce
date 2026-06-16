import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/dioProvider/dio_provider.dart';
import 'package:ecommerce_app/home/model/category_model.dart';
import 'package:ecommerce_app/home/model/list_of_models.dart';
import 'package:ecommerce_app/home/model/productModel/product_model.dart';
import 'package:ecommerce_app/home/provider/add_product_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductRepository {
  final Ref ref;
  ProductRepository({required this.ref});

  Dio get _dio => ref.read(dioProvdier);
  Future<ProductModel> getProduct({String? search, String? category}) async {
    final response = await _dio.get("/products?q=$search&category=$category");
    return ProductModel.fromJson(response.data);
  }

  //   Future<void> addToWishList(String productId) async {
  //     await _dio.post('/wishlist/$productId', data: {'name': productName});
  //   }
  // }

  Future<List<CategoryModel>> fetchCategotyData() async {
    final response = await _dio.get('/categories');

    final mapWithCategoryModel = (response.data['data'] as List)
        .map((element) => CategoryModel.fromJson(element))
        .toList();
    return mapWithCategoryModel;
  }

  Future<Featured> getProductDeatil(String id) async {
    final response = await _dio.get('/products/$id');
    final product = Featured.fromJson(response.data['data']);
    return product;
  }

  // Future<Featured> addProduct({required AddProdct product}) async {
  //   _dio.post('/sdjal', data: {
  //     'name': product.name,
  //   })
  // }
}
