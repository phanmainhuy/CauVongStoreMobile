import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:cauvongstore_mobile/src/screen/categories/category_menu/categories_menu_page.dart';
import 'package:cauvongstore_mobile/src/screen/detail/detail_page.dart';
import 'package:cauvongstore_mobile/src/components/item_card.dart';
import 'package:cauvongstore_mobile/src/screen/login/login_page.dart';
import 'package:cauvongstore_mobile/src/screen/my_order/my_order_page.dart';
import 'package:cauvongstore_mobile/src/screen/search/search_page.dart';
import 'package:flutter/material.dart';
import 'category_item.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
  int pageCarousel = 0;

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
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategoriesMenuPage()));
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              Const.imgLogoNetwork,
              fit: BoxFit.contain,
              height: 32,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(1.0),
              child: const Text('Trang chủ'),
            ),
          ],
        ),
        backgroundColor: AppColor.kPrimaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.note_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
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
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // // carousel
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 2,
              autoPlay: false,
              onPageChanged: (index, _) => {
                setState(() {
                  pageCarousel = index;
                })
              },
            ),
            items: _buildImageSliders,
          ),
          Center(
            child: CarouselIndicator(
                activeColor: Colors.black,
                count: imgList.length,
                index: pageCarousel,
                color: Colors.grey),
          ),

          const SizedBox(
            height: 10,
          ),
          Text(
            "Sản phẩm khuyến mãi".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontSizeText.fontNormalSize,
                color: Colors.black),
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
            height: 20,
          ),
          Text(
            "Sản phẩm theo loại gì đó".toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontSizeText.fontNormalSize,
                color: Colors.black),
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

  Widget get _buildMyOrderButton => SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              // padding: MaterialStateProperty.all<EdgeInsets>(
              //     const EdgeInsets.all(15)),
              foregroundColor:
                  MaterialStateProperty.all<Color>(AppColor.kPrimaryColor),
              // backgroundColor: MaterialStateProperty.all<Color>(AppColor.blue),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19.0),
                      side: const BorderSide(color: AppColor.kPrimaryColor)))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyOrderPage(),
              ),
            );
          },
          child: Text(
            "mua".toUpperCase(),
            style: const TextStyle(
                color: AppColor.kPrimaryColor,
                fontSize: FontSizeText.fontNormalSize),
          ),
        ),
      );

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
      ),
      CategoryModel(
        image:
            'https://tapchicongthuong.vn/images/19/9/19/6-mon-tuyet-doi-dung-nau-voi-thit-lon.jpg',
        name: 'Thit',
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
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Trái cây',
        id: 'Sữa các loại',
      ),
      CategoryModel(
        image:
            'https://image.thanhnien.vn/w1024/Uploaded/2023/wpxlcqjwq/2022_04_10/rau-2229.jpg',
        name: 'Trái cây',
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
