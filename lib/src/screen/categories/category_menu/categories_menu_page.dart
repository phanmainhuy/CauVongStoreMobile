import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:cauvongstore_mobile/src/screen/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesMenuPage extends StatelessWidget {
  const CategoriesMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _CategoriesMenuPage();
  }
}

class _CategoriesMenuPage extends StatefulWidget {
  const _CategoriesMenuPage({super.key});

  @override
  State<_CategoriesMenuPage> createState() => __CategoriesMenuPageState();
}

class __CategoriesMenuPageState extends State<_CategoriesMenuPage> {
  List<CategoryModel> categories = <CategoryModel>[];

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
            itemCount: categories.length,
            separatorBuilder: (_, index) => const SizedBox(height: 15),
            itemBuilder: (_, index) => ListTile(
              title: Text(
                categories[index].name,
                style: const TextStyle(
                  fontSize: FontSizeText.fontNormalSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

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
        name: 'Trái cây',
        id: 'Sữa các loại',
      ),
    ];
    setState(() {
      categories = list;
    });
  }
}
