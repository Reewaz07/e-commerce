import 'package:ecommerce_app/home/provider/product_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailPage extends ConsumerWidget {
  final String id;
  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productDetailProvider(ProductFilter(id: id, short: short, dd: dd)));
    // return products.maybeWhen(orElse: )
    return Container();
  }
}
