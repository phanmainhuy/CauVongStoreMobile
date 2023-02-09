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
              physics: NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              shrinkWrap: true,
              separatorBuilder: (_, index) => const SizedBox(height: 15),
              itemBuilder: (_, index) {
                // ListTile(
                //   title: Text(
                //     categories[index].name,
                //     style: const TextStyle(
                //       fontSize: FontSizeText.fontNormalSize,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   trailing: IconButton(
                //     icon: Icon(
                //       Icons.navigate_next,
                //       color: Colors.grey,
                //     ),
                //     onPressed: () {},
                //   ),
                // ),
                ExpansionTile(
                  title: Text(
                    categories[index].name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  children: _products.subMenu.map(_buildList).toList(),
                );
              }),
        ),
      );

  Widget _buildList(ProductModel list) {
    // if (list.name.isEmpty)
    //   return Builder(builder: (context) {
    //     return ListTile(
    //         onTap: () => Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => SubCategory(list.name))),
    //         leading: SizedBox(),
    //         title: Text(list.name));
    //   });
    return ExpansionTile(
      title: Text(
        list.name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: list.subMenu.map(_buildList).toList(),
    );
  }

  void _createCategoryData() {
    var list = <CategoryModel>[
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Trái cây',
        id: 'Sữa các loại',
      ),
      CategoryModel(
        image:
            'https://tapchicongthuong.vn/images/19/9/19/6-mon-tuyet-doi-dung-nau-voi-thit-lon.jpg',
        name: 'Thịt',
        id: 'Sữa các loại',
      ),
      CategoryModel(
        image:
            'https://cdn.tgdd.vn/Files/2017/10/26/1036030/rau-xa-lach-cong-dung-va-cach-phan-biet-cac-loai-xa-lach-202201191047303747.jpg',
        name: 'Rau',
        id: 'Sữa các loại',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Sữa',
        id: '1',
      ),
    ];
    setState(() {
      categories = list;
    });
  }

  //Set cung data
  void _createProductData() {
    var list = <ProductModel>[
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: 'Sữa các loại',
          image:
              'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: 'Sữa các loại',
          image:
              'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: 'Sữa các loại',
          image:
              'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: 'Sữa các loại',
          image:
              'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: 'Sữa các loại',
          image:
              'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
      ProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          id: 'Sữa các loại',
          image:
              'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
          price: 10000,
          description: 'Description of product',
          categoryId: '1'),
    ];
    setState(() {
      _products = list;
    });
  }
}
