import 'package:ecommerce_app/home/riverpod/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Container(
      child: products.maybeWhen(
        orElse: () => SizedBox(),
        data: (data) => Text(data.data.toString()),
        error: (error, stackTrace) => Text(error),
        loading: 
      ),
    );
  }
}
