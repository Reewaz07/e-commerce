import 'list_product_model.dart';

class ProductModel {
  final bool success;
  final List<Datum> data;
  final Meta meta;

  ProductModel({required this.success, required this.data, required this.meta});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e))
          .toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}
