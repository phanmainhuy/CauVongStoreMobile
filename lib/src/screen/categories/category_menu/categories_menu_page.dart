import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:cauvongstore_mobile/src/screen/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesMenuPage extends StatelessWidget {
  const CategoriesMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CategoriesMenuPage();
  }
}

class _CategoriesMenuPage extends StatefulWidget {
  const _CategoriesMenuPage({
    Key? key,
  }) : super(key: key);

  @override
  State<_CategoriesMenuPage> createState() => __CategoriesMenuPageState();
}

class __CategoriesMenuPageState extends State<_CategoriesMenuPage> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ProductModel> _products = <ProductModel>[];

  @override
  void initState() {
    super.initState();
    _createCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Loại sản phẩm'),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
          const SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildCard,
          ),
        ],
      ),
    );
  }

  Widget get _buildCard => Padding(
        // add submenu products
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Card(
          elevation: 4.0,
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              shrinkWrap: true,
              separatorBuilder: (_, index) => const SizedBox(height: 15),
              itemBuilder: (_, index) {
                return ExpansionTile(
                  title: Text(
                    categories[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    ..._products.map((e) {
                      if (e.categoryId == categories[index].id) {
                        // return ListTile(
                        //   title: Text(
                        //     _products[index].name,
                        //     style: const TextStyle(fontSize: 17),
                        //   ),
                        //   // children: list.subMenu.map(_buildList).toList(),
                        // );
                        return ListTile(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ProductModel(list.name))),
                          },
                          leading: SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.network(
                              _products[index].image,
                            ),
                          ),
                          title: Text(
                            _products[index].name,
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }).toList(),
                  ],
                );
              }),
        ),
      );

  void _createCategoryData() {
    var listCategories = <CategoryModel>[
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Trái cây',
        id: '2',
      ),
      CategoryModel(
        image:
            'https://tapchicongthuong.vn/images/19/9/19/6-mon-tuyet-doi-dung-nau-voi-thit-lon.jpg',
        name: 'Thịt',
        id: '3',
      ),
      CategoryModel(
        image:
            'https://cdn.tgdd.vn/Files/2017/10/26/1036030/rau-xa-lach-cong-dung-va-cach-phan-biet-cac-loai-xa-lach-202201191047303747.jpg',
        name: 'Rau',
        id: '4',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Sữa',
        id: '1',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Test',
        id: '5',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Test',
        id: '7',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Test',
        id: '8',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Test',
        id: '11',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Test',
        id: '12',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Test',
        id: '13',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Test',
        id: '14',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Test',
        id: '15',
      ),
    ];
    var listProduct = <ProductModel>[
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: '1',
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: '9',
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa chua dinh dưỡng',
          id: '0',
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: '2',
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: '2',
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: '2',
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '2'),
    ];

    setState(() {
      categories = listCategories;
      _products = listProduct;
    });
  }
}
