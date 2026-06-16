import 'package:dio/dio.dart';
import 'package:ecommerce_app/auth/riverpod/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NetworkInteceptor extends Interceptor {
  final Ref ref;

  NetworkInteceptor({required this.ref});
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await ref
        .read(firebaseAuthProvider)
        .currentUser
        ?.getIdToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});
    super.onRequest(options, handler);
  }
}
