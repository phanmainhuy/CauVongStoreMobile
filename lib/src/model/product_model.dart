class ProductModel {
  final String image;
  final String name;
  final int? price;
  final String id;
  final String? description;
  final String categoryId;

  ProductModel(
      {required this.image,
      required this.name,
      this.price,
      required this.id,
      required this.categoryId,
      this.description});

  factory ProductModel.fromJson({required Map<String, dynamic> data}) {
    return ProductModel(
        name: data['name'],
        id: data['id'],
        image: data['image'],
        categoryId: data['category'],
        description: data['descript'],
        price: int.tryParse(data['price']));
  }
}
