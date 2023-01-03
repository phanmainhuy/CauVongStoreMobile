class CategoryDetailModel {
  final String image;
  final String name;
  final String id;
  final String color;

  CategoryDetailModel(
      {required this.image,
      required this.name,
      required this.id,
      required this.color});

  factory CategoryDetailModel.fromJson(
      {required String id, required Map<String, dynamic> data}) {
    return CategoryDetailModel(
        name: data['name'], id: id, image: data['image'], color: data['color']);
  }
}
