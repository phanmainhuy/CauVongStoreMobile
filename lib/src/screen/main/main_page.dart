import 'package:cauvongstore_mobile/src/model/category_model.dart';
import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:cauvongstore_mobile/src/screen/promotion/promotion_page.dart';
import 'package:flutter/material.dart';
import '../../resources/app_color.dart';
import '../notification/notification_page.dart';
import '../profile/profile_page.dart';
import '../home/home_page.dart';
// import '../home/nav_drawer_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> imgList = [
    'assets/images/slides/slide1.jpg',
    'assets/images/slides/slide2.jpg',
    'assets/images/slides/slide3.jpg',
    'assets/images/slides/slide4.jpg',
  ];
  List<ProductModel> _products = <ProductModel>[];
  List<CategoryModel> categories = <CategoryModel>[];
  PageController pageController = PageController();
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    HomePage(),
    PromotionPage(),
    CartPage(),
    NotificationPage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home Page'),
      //   backgroundColor: AppColor.kPrimaryColor,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(
      //         Icons.shopping_cart,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (context) => CartPage()));
      //       },
      //     )
      //   ],
      // ),
      // drawer: NavDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          //change page
          if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          } else {
            setState(() {
              pageIndex = value;
            });
            pageController.animateToPage(pageIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.kPrimaryColor,
        unselectedItemColor: AppColor.kFontColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: "Promotion",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: pageList[pageIndex],
    );
  }
}
