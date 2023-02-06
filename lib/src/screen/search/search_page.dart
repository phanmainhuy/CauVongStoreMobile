import 'package:cauvongstore_mobile/src/components/search_field.dart';
import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/detail/detail_page.dart';
import 'package:cauvongstore_mobile/src/components/item_card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchCtr = TextEditingController();
  List<ProductModel> _products = <ProductModel>[];

  @override
  void initState() {
    super.initState();
    _createProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Tìm kiếm sản phẩm'),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: SearchField(
                      controller: searchCtr,
                      hint: 'Tìm kiếm',
                      onTap: () {},
                      onChange: (String value) {
                        // context.read<UserProvider>().searchUser();
                      },
                      readOnly: false,
                      onSubmit: () => (_) {
                        // call search API function
                        setState(() {
                          // set state again
                          // _buildSearchResult;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
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
        ),
      ),
    );
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
