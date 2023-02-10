class CategoryModel {
  final int id;
  final String name;
  final String image;
  final String? deleted;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.deleted,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      id: data['id'],
      name: data['name'],
      image: data['image'],
      deleted: data['deletedAt'] ?? '',
    );
  }

  static List<CategoryModel> fromJsonList(List resultList) {
    return resultList.map((data) => CategoryModel.fromJson(data)).toList();
  }
}
