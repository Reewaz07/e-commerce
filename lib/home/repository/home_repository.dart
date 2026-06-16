import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/dioProvider/dio_provider.dart';
import 'package:ecommerce_app/home/model/home_model.dart';
import 'package:ecommerce_app/home/model/list_of_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeRepository {
  final Ref ref;
  HomeRepository({required this.ref});

  Dio get _dio => ref.read(dioProvdier);

  Future<HomeModel> getHomeData() async {
    final response = await _dio.get("/home");
    final data = response.data["data"];

    return HomeModel(
      ((data['banners'] as List?) ?? [])
          .map((e) => Banners.fromJson(e))
          .toList(),
      ((data['featured'] as List?) ??
              []) // ✅ was "feature", API sends "featured"
          .map((e) => Featured.fromJson(e))
          .toList(),
      ((data['deals'] as List?) ?? []).map((e) => Deal.fromJson(e)).toList(),
      ((data['categories'] as List?) ?? [])
          .map((e) => Category.fromJson(e))
          .toList(),
      ((data['newArrivals'] as List?) ?? []) // ✅ new
          .map((e) => Featured.fromJson(e))
          .toList(),
    );
  }
}
