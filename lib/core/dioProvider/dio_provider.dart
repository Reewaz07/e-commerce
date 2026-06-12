import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvdier = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: "https://astrixstore.heyaayush.com/api/v1"));
});
