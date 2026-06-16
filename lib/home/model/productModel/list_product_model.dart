class Datum {
  Datum({
    required this.id,
    required this.slug,
    required this.attributes,
    required this.basePrice,
    required this.categoryId,
    required this.createdAt,
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
    required this.category,
  });

  String id;
  String slug;
  Attributes attributes;
  int basePrice;
  String categoryId;
  DateTime createdAt;
  String description;
  List<String> images;
  bool isActive;
  bool isDeleted;
  bool isFeatured;
  String name;
  double ratingAvg;
  int ratingCount;
  int? salePrice;
  int stock;
  List<String> tags;
  DateTime updatedAt;
  List<Variant> variants;
  Category category;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      attributes: Attributes.fromJson(json['attributes'] ?? {}),
      basePrice: json['basePrice'] ?? 0,
      categoryId: json['categoryId'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      description: json['description'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      isActive: json['isActive'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      name: json['name'] ?? '',
      ratingAvg: (json['ratingAvg'] ?? 0).toDouble(),
      ratingCount: json['ratingCount'] ?? 0,
      salePrice: json['salePrice'],
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      updatedAt: DateTime.parse(json['updatedAt']),
      variants: (json['variants'] as List<dynamic>? ?? [])
          .map((e) => Variant.fromJson(e))
          .toList(),
      category: Category.fromJson(json['category'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {};
}

class Attributes {
  Attributes({
    required this.brand,
    required this.grain,
    required this.origin,
    required this.type,
    required this.weight,
    required this.fatContent,
    required this.storage,
  });

  String brand;
  String grain;
  String origin;
  String type;
  String weight;
  String fatContent;
  String storage;

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      brand: json['brand'] ?? '',
      grain: json['grain'] ?? '',
      origin: json['origin'] ?? '',
      type: json['type'] ?? '',
      weight: json['weight'] ?? '',
      fatContent: json['fatContent'] ?? '',
      storage: json['storage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {};
}

class Category {
  Category({
    required this.id,
    required this.slug,
    required this.imageUrl,
    required this.name,
  });

  String id;
  String slug;
  String imageUrl;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      slug: json['slug'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {};
}

class Variant {
  Variant({
    required this.sku,
    required this.name,
    required this.options,
    required this.price,
    required this.stock,
  });

  String sku;
  String name;
  Options options;
  int price;
  int stock;

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      sku: json['sku'] ?? '',
      name: json['name'] ?? '',
      options: Options.fromJson(json['options'] ?? {}),
      price: json['price'] ?? 0,
      stock: json['stock'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {};
}

class Options {
  Options({
    required this.weight,
    required this.size,
  });

  String weight;
  String size;

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      weight: json['weight'] ?? '',
      size: json['size'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {};
}

class Meta {
  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
    required this.hasNext,
  });

  int page;
  int limit;
  int total;
  int totalPages;
  bool hasNext;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      total: json['total'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      hasNext: json['hasNext'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {};
}