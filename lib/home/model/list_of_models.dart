import 'package:flutter/material.dart';

class Banners {
  final String id;
  final String title;
  final String createdAt;
  final String imageUrl;
  final bool isActive;
  final int order;
  final String linkvalue;
  final String deals;
  final String updatedAt;

  Banners({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.imageUrl,
    required this.isActive,
    required this.order,
    required this.linkvalue,
    required this.deals,
    required this.updatedAt,
  });

  factory Banners.fromJson(dynamic json) {
    return Banners(
      id: json['id'].toString(),
      title: json['title'].toString(),
      createdAt: json['createdAt'].toString(),
      imageUrl: json['imageUrl']
          .toString(), // ✅ was json["image"], API sends "imageUrl"
      isActive: json['isActive'] as bool,
      order: json['order'] as int,
      linkvalue: json["linkValue"]
          .toString(), // ✅ was "linkvalue", API sends "linkValue"
      deals: json['placement']
          .toString(), // ✅ was "deals", API sends "placement"
      updatedAt: json['updatedAt'].toString(),
    );
  }
}

class Category {
  final String id;
  final String slug;
  final DateTime createdAt;
  final String imageUrl;
  final bool isActive;
  final bool isDeleted;
  final String name;
  final int order;
  final dynamic parentId;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.imageUrl,
    required this.isActive,
    required this.isDeleted,
    required this.name,
    required this.order,
    required this.parentId,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      imageUrl: json['imageUrl'] ?? '',
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      name: json['name'] ?? '',
      order: json['order'] ?? 0,
      parentId: json['parentId'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Deal {
  final String id;
  final String slug;
  final DealAttributes attributes;
  final int basePrice;
  final String categoryId;
  final DateTime createdAt;
  final Currency currency;
  final String description;
  final List<String> images;
  final bool isActive;
  final bool isDeleted;
  final bool isFeatured;
  final String name;
  final double ratingAvg;
  final int ratingCount;
  final int salePrice;
  final int stock;
  final List<String> tags;
  final DateTime updatedAt;
  final List<DealVariant> variants;

  Deal({
    required this.id,
    required this.slug,
    required this.attributes,
    required this.basePrice,
    required this.categoryId,
    required this.createdAt,
    required this.currency,
    required this.description,
    required this.images,
    required this.isActive,
    required this.isDeleted,
    required this.isFeatured,
    required this.name,
    required this.ratingAvg,
    required this.ratingCount,
    required this.salePrice,
    required this.stock,
    required this.tags,
    required this.updatedAt,
    required this.variants,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      attributes: DealAttributes.fromJson(json['attributes'] ?? {}),
      basePrice: json['basePrice'] ?? 0,
      categoryId: json['categoryId'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      currency: Currency.values.firstWhere(
        (e) => e.name == json['currency'],
        orElse: () => Currency.NPR,
      ),
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      name: json['name'] ?? '',
      ratingAvg: (json['ratingAvg'] ?? 0).toDouble(),
      ratingCount: json['ratingCount'] ?? 0,
      salePrice: json['salePrice'] ?? 0,
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      updatedAt: DateTime.parse(json['updatedAt']),
      variants: (json['variants'] as List? ?? [])
          .map((e) => DealVariant.fromJson(e))
          .toList(),
    );
  }
}

class DealAttributes {
  final String brand;
  final String grain;
  final String origin;
  final String type;
  final String weight;

  DealAttributes({
    required this.brand,
    required this.grain,
    required this.origin,
    required this.type,
    required this.weight,
  });
  factory DealAttributes.fromJson(Map<String, dynamic> json) {
    return DealAttributes(
      brand: json['brand'] ?? '',
      grain: json['grain'] ?? '',
      origin: json['origin'] ?? '',
      type: json['type'] ?? '',
      weight: json['weight'] ?? '',
    );
  }
}

enum Currency { NPR }

class Featured {
  Featured({
    required this.id,
    required this.slug,
    required this.attributes,
    required this.basePrice,
    required this.categoryId,
    required this.createdAt,
    required this.currency,
    required this.description,
    required this.images,
    required this.isActive,
    required this.isDeleted,
    required this.isFeatured,
    required this.name,
    required this.ratingAvg,
    required this.ratingCount,
    required this.salePrice,
    required this.stock,
    required this.tags,
    required this.updatedAt,
    required this.variants,
  });

  String id;
  String slug;
  FeaturedAttributes attributes;
  int basePrice;
  String categoryId;
  DateTime createdAt;
  Currency currency;
  String description;
  List<String> images;
  bool isActive;
  bool isDeleted;
  bool isFeatured;
  String name;
  double ratingAvg;
  int ratingCount;
  int salePrice;
  int stock;
  List<String> tags;
  DateTime updatedAt;
  List<FeaturedVariant> variants;

  factory Featured.fromJson(Map<String, dynamic> json) {
    return Featured(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      attributes: FeaturedAttributes.fromJson(json['attributes'] ?? {}),
      basePrice: json['basePrice'] ?? 0,
      categoryId: json['categoryId'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      currency: Currency.values.firstWhere(
        (e) => e.name == json['currency'],
        orElse: () => Currency.NPR,
      ),
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      name: json['name'] ?? '',
      ratingAvg: (json['ratingAvg'] ?? 0).toDouble(),
      ratingCount: json['ratingCount'] ?? 0,
      salePrice: json['salePrice'] ?? 0,
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      updatedAt: DateTime.parse(json['updatedAt']),
      variants: (json['variants'] as List? ?? [])
          .map((e) => FeaturedVariant.fromJson(e))
          .toList(),
    );
  }
}

class DealVariant {
  String sku;
  String name;
  PurpleOptions options;
  int price;
  int stock;
  DealVariant({
    required this.sku,
    required this.name,
    required this.options,
    required this.price,
    required this.stock,
  });
  factory DealVariant.fromJson(Map<String, dynamic> json) {
    return DealVariant(
      sku: json['sku'] ?? '',
      name: json['name'] ?? '',
      options: PurpleOptions.fromJson(json['options'] ?? {}),
      price: json['price'] ?? 0,
      stock: json['stock'] ?? 0,
    );
  }
}

class PurpleOptions {
  PurpleOptions({required this.weight});

  String weight;
  factory PurpleOptions.fromJson(Map<String, dynamic> json) {
    return PurpleOptions(weight: json['weight'] ?? '');
  }
}

class FeaturedAttributes {
  FeaturedAttributes({
    required this.brand,
    required this.fatContent,
    required this.storage,
    required this.origin,
    required this.type,
    required this.weight,
    required this.grain,
  });

  String brand;
  String fatContent;
  String storage;
  String origin;
  String type;
  String weight;
  String grain;

  factory FeaturedAttributes.fromJson(Map<String, dynamic> json) {
    return FeaturedAttributes(
      brand: json['brand'] ?? '',
      fatContent: json['fatContent'] ?? '',
      storage: json['storage'] ?? '',
      origin: json['origin'] ?? '',
      type: json['type'] ?? '',
      weight: json['weight'] ?? '',
      grain: json['grain'] ?? '',
    );
  }
}

class FeaturedVariant {
  FeaturedVariant({
    required this.sku,
    required this.name,
    required this.options,
    required this.price,
    required this.stock,
  });

  String sku;
  String name;
  FluffyOptions options;
  int price;
  int stock;

  factory FeaturedVariant.fromJson(Map<String, dynamic> json) {
    return FeaturedVariant(
      sku: json['sku'] ?? '',
      name: json['name'] ?? '',
      options: FluffyOptions.fromJson(json['options'] ?? {}),
      price: json['price'] ?? 0,
      stock: json['stock'] ?? 0,
    );
  }
}

class FluffyOptions {
  FluffyOptions({required this.size, required this.weight});

  String size;
  String weight;
  factory FluffyOptions.fromJson(Map<String, dynamic> json) {
    return FluffyOptions(
      size: json['size'] ?? '',
      weight: json['weight'] ?? '',
    );
  }
}
