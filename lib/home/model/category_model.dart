class CategoryModel {
  final String id;
  final String? slug;
  final String imageUrl;
  final String categoryName;

  CategoryModel({
    required this.id,
    this.slug,
    required this.imageUrl,
    required this.categoryName,
  });

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'],
      categoryName: json['name'],
    );
  }
}
