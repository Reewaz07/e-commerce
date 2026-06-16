import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/dioProvider/network_inteceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvdier = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: "https://astrixstore.heyaayush.com/api/v1"))
    ..interceptors.add(NetworkInteceptor(ref: ref));
});
