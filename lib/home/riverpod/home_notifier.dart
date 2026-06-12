import 'dart:async';

import 'package:ecommerce_app/home/model/home_model.dart';
import 'package:ecommerce_app/home/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends AsyncNotifier<HomeModel> {
  @override
  FutureOr<HomeModel> build() {
    final repo = HomeRepository(ref: ref).getHomeData();
    return repo;
  }
}
