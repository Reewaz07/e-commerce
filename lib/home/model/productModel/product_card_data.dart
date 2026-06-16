import 'package:ecommerce_app/home/model/list_of_models.dart' as home_models;
import 'package:ecommerce_app/home/model/productModel/list_product_model.dart'
    as product_models;

class ProductCardData {
  final String id;
  final String imageUrl;
  final String brand;
  final String name;
  final int basePrice; // stored in paisa
  final int? salePrice; // null means no discount
  final double rating;
  final int ratingCount;
  bool isFavorite;

  ProductCardData({
    required this.id,
    required this.imageUrl,
    required this.brand,
    required this.name,
    required this.basePrice,
    this.salePrice,
    required this.rating,
    required this.ratingCount,
    this.isFavorite = false,
  });

  /// Converts paisa to NPR string e.g. 12000 → "Rs. 120.00"
  String get displayPrice {
    final price = salePrice != null && salePrice! < basePrice
        ? salePrice!
        : basePrice;
    return 'Rs. ${(price / 100).toStringAsFixed(2)}';
  }

  /// Original price shown struck-through when on sale
  String? get originalPrice {
    if (salePrice != null && salePrice! < basePrice) {
      return 'Rs. ${(basePrice / 100).toStringAsFixed(2)}';
    }
    return null;
  }

  /// Discount % badge e.g. "7% OFF"
  String? get discountBadge {
    if (salePrice != null && salePrice! < basePrice) {
      final pct = ((basePrice - salePrice!) / basePrice * 100).round();
      return '$pct% OFF';
    }
    return null;
  }

  factory ProductCardData.fromFeatured(home_models.Featured f) {
    return ProductCardData(
      id: f.id,
      imageUrl: f.images.isNotEmpty ? f.images.first : '',
      brand: f.attributes.brand.isNotEmpty ? f.attributes.brand : f.name,
      name: f.name,
      basePrice: f.basePrice,
      salePrice: f.salePrice > 0 ? f.salePrice : null,
      rating: f.ratingAvg,
      ratingCount: f.ratingCount,
    );
  }

  factory ProductCardData.fromDeal(home_models.Deal d) {
    return ProductCardData(
      id: d.id,
      imageUrl: d.images.isNotEmpty ? d.images.first : '',
      brand: d.attributes.brand.isNotEmpty ? d.attributes.brand : d.name,
      name: d.name,
      basePrice: d.basePrice,
      salePrice: d.salePrice > 0 ? d.salePrice : null,
      rating: d.ratingAvg,
      ratingCount: d.ratingCount,
    );
  }

  factory ProductCardData.fromDatum(product_models.Datum d) {
    return ProductCardData(
      id: d.id,
      imageUrl: d.images.isNotEmpty ? d.images.first : '',
      brand: d.attributes.brand.isNotEmpty ? d.attributes.brand : d.name,
      name: d.name,
      basePrice: d.basePrice,
      salePrice: d.salePrice,
      rating: d.ratingAvg,
      ratingCount: d.ratingCount,
    );
  }

  ProductCardData copyWith({bool? isFavorite}) {
    return ProductCardData(
      id: id,
      imageUrl: imageUrl,
      brand: brand,
      name: name,
      basePrice: basePrice,
      salePrice: salePrice,
      rating: rating,
      ratingCount: ratingCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
