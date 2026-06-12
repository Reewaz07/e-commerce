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

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'grain': grain,
      'origin': origin,
      'type': type,
      'weight': weight,
      'fatContent': fatContent,
      'storage': storage,
    };
  }
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

  Map<String, dynamic> toJson() {
    return {'id': id, 'slug': slug, 'imageUrl': imageUrl, 'name': name};
  }
}

class Options {
  Options({required this.weight, required this.size});

  String weight;
  String size;

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(weight: json['weight'] ?? '', size: json['size'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'weight': weight, 'size': size};
  }
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

  Map<String, dynamic> toJson() {
    return {
      'sku': sku,
      'name': name,
      'options': options.toJson(),
      'price': price,
      'stock': stock,
    };
  }
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

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'total': total,
      'totalPages': totalPages,
      'hasNext': hasNext,
    };
  }
}
