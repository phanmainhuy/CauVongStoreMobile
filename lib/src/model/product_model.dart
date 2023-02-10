class ProductModel {
  final int totalRecord;
  final int currentPage;
  final int? totalRecordOfPage;
  final List<ProductDataModel>? data;

  ProductModel({
    required this.totalRecord,
    required this.currentPage,
    required this.totalRecordOfPage,
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      totalRecord: data['totalRecord'],
      currentPage: data['currentPage'],
      totalRecordOfPage: data['totalRecordOfPage'],
      data: ProductDataModel.fromJsonList(data['data']),
    );
  }
}

class ProductDataModel {
  final int id;
  final String name;
  final String image;
  final int? price;
  final String saleFrom;
  final String saleTo;
  final String salePercent;
  final String salePrice;
  final String deletedAt;
  final bool isSale;
  final String barCode;

  ProductDataModel({
    required this.saleFrom,
    required this.saleTo,
    required this.salePercent,
    required this.salePrice,
    required this.deletedAt,
    required this.isSale,
    required this.barCode,
    required this.id,
    required this.image,
    required this.name,
    this.price,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> data) {
    return ProductDataModel(
      id: data['id'],
      name: data['name'],
      image: data['image'],
      saleFrom: data['saleFrom'],
      price: int.tryParse(
        data['price'],
      ),
      barCode: data['barCode'],
      deletedAt: data['deletedAt'],
      salePercent: data['salePercent'],
      salePrice: data['prsalePriceice'],
      saleTo: data['saleTo'],
      isSale: data['isSale'],
    );
  }

  static List<ProductDataModel> fromJsonList(List resultList) {
    return resultList.map((data) => ProductDataModel.fromJson(data)).toList();
  }
}
