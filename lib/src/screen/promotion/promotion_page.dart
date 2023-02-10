import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:cauvongstore_mobile/src/components/item_card.dart';
import 'package:cauvongstore_mobile/src/screen/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../detail/detail_page.dart';

class PromotionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotion'),
        backgroundColor: AppColor.kPrimaryColor,
        actions: <Widget>[
          // have search
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
          ),
          // have cart
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
          const SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: _PromotionPage(),
    );
  }
}

class _PromotionPage extends StatefulWidget {
  const _PromotionPage({Key? key}) : super(key: key);

  @override
  State<_PromotionPage> createState() => __PromotionPageState();
}

class __PromotionPageState extends State<_PromotionPage> {
  List<ProductDataModel> _products = <ProductDataModel>[];

  @override
  void initState() {
    super.initState();
    _createProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                mainAxisExtent: 120,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: _products[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      product: _products[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  //Set cung data
  void _createProductData() {
    // var list = <ProductDataModel>[
    //   ProductDataModel(
    //     name: 'Lốc 4 hộp sữa dinh dưỡng',
    //     id: 1,
    //     image:
    //         'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //     price: 10000,
    //   ),
    //   ProductDataModel(
    //       name: 'Lốc 4 hộp sữa dinh dưỡng',
    //       id: 'Sữa các loại',
    //       image:
    //           'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //       price: 10000,
    //       description: 'Description of product',
    //       categoryId: '1'),
    //   ProductDataModel(
    //       name: 'Lốc 4 hộp sữa dinh dưỡng',
    //       id: 'Sữa các loại',
    //       image:
    //           'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //       price: 10000,
    //       description: 'Description of product',
    //       categoryId: '1'),
    //   ProductDataModel(
    //       name: 'Lốc 4 hộp sữa dinh dưỡng',
    //       id: 'Sữa các loại',
    //       image:
    //           'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //       price: 10000,
    //       description: 'Description of product',
    //       categoryId: '1'),
    //   ProductDataModel(
    //       name: 'Lốc 4 hộp sữa dinh dưỡng',
    //       id: 'Sữa các loại',
    //       image:
    //           'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //       price: 10000,
    //       description: 'Description of product',
    //       categoryId: '1'),
    //   ProductDataModel(
    //       name: 'Lốc 4 hộp sữa dinh dưỡng',
    //       id: 'Sữa các loại',
    //       image:
    //           'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //       price: 10000,
    //       description: 'Description of product',
    //       categoryId: '1'),
    //   ProductDataModel(
    //       name: 'Lốc 4 hộp sữa dinh dưỡng',
    //       id: 'Sữa các loại',
    //       image:
    //           'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //       price: 10000,
    //       description: 'Description of product',
    //       categoryId: '1'),
    //   ProductDataModel(
    //       name: 'Lốc 4 hộp sữa dinh dưỡng',
    //       id: 'Sữa các loại',
    //       image:
    //           'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //       price: 10000,
    //       description: 'Description of product',
    //       categoryId: '1'),
    //   ProductDataModel(
    //       name: 'Lốc 4 hộp sữa dinh dưỡng',
    //       id: 'Sữa các loại',
    //       image:
    //           'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //       price: 10000,
    //       description: 'Description of product',
    //       categoryId: '1'),
    //   ProductDataModel(
    //       name: 'Lốc 4 hộp sữa dinh dưỡng',
    //       id: 'Sữa các loại',
    //       image:
    //           'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
    //       price: 10000,
    //       description: 'Description of product',
    //       categoryId: '1'),
    // ];
    setState(() {
      // _products = list;
    });
  }
}
