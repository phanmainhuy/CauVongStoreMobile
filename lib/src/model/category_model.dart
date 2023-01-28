class CategoryModel {
  final String image;
  final String name;
  final String id;

  CategoryModel({
    required this.image,
    required this.name,
    required this.id,
  });

  factory CategoryModel.fromJson(
      {required String id, required Map<String, dynamic> data}) {
    return CategoryModel(
      id: id,
      name: data['name'],
      image: data['image'],
    );
  }
}
