import 'package:carousel_slider/carousel_slider.dart';
import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:cauvongstore_mobile/src/screen/detail/detail_page.dart';
import 'package:cauvongstore_mobile/src/screen/home/item_card.dart';
import 'package:flutter/material.dart';
import 'category_item.dart';
import 'nav_drawer_widget.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/images/slides/slide1.jpg',
    'assets/images/slides/slide2.jpg',
    'assets/images/slides/slide3.jpg',
    'assets/images/slides/slide4.jpg',
  ];
  List<ProductModel> _products = <ProductModel>[];
  List<CategoryModel> categories = <CategoryModel>[];
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    _createProductData();
    _createCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: AppColor.kPrimaryColor,
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      drawer: NavDrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // carousel
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 2,
              autoPlay: true,
            ),
            items: _buildImageSliders,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Menu loại".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildCategories,
          const SizedBox(
            height: 10,
          ),
          Text(
            "Sản phẩm khuyến mãi".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
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
            height: 10,
          ),
          Text(
            "Sản phẩm theo loại gì đó".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 120,
                  // crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: _products[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get _buildImageSliders => imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();

  Widget get _buildCategories => SizedBox(
        height: 50,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, index) => const SizedBox(width: 20),
          itemCount: categories.length,
          itemBuilder: (_, index) => CategoryItem(data: categories[index]),
        ),
      );

  void _createCategoryData() {
    var list = <CategoryModel>[
      CategoryModel(
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          name: 'Trái cây',
          id: 'Sữa các loại',
          color: ''),
      CategoryModel(
          image:
              'https://tapchicongthuong.vn/images/19/9/19/6-mon-tuyet-doi-dung-nau-voi-thit-lon.jpg',
          name: 'Thit',
          id: 'Sữa các loại',
          color: ''),
      CategoryModel(
          image:
              'https://cdn.tgdd.vn/Files/2017/10/26/1036030/rau-xa-lach-cong-dung-va-cach-phan-biet-cac-loai-xa-lach-202201191047303747.jpg',
          name: 'Rau',
          id: 'Sữa các loại',
          color: ''),
      CategoryModel(
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          name: 'Trái cây',
          id: 'Sữa các loại',
          color: ''),
      CategoryModel(
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          name: 'Trái cây',
          id: 'Sữa các loại',
          color: ''),
      CategoryModel(
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          name: 'Trái cây',
          id: 'Sữa các loại',
          color: ''),
      CategoryModel(
          image:
              'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
          name: 'Trái cây',
          id: 'Sữa các loại',
          color: ''),
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
