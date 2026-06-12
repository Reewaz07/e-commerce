import 'dart:math';

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
    final homeModel = HomeModel(
      (response.data["data"]['banners'] as List<dynamic>)
          .map((e) => Banners.fromJson(e))
          .toList(),
      (response.data["data"]["feature"] as List<dynamic>)
          .map((e) => Featured.fromJson(e))
          .toList(),
      (response.data["data"]["deals"] as List<dynamic>)
          .map((e) => Deal.fromJson(e))
          .toList(),
      (response.data["data"]["categories"] as List<dynamic>)
          .map((e) => Category.fromJson(e))
          .toList(),
    );
    return homeModel;
  }
}
