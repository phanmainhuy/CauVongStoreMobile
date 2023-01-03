import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../resources/app_color.dart';
import '../notification/notification_page.dart';
import '../profile/profile_page.dart';
import 'nav_drawer_widget.dart';

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
  PageController pageController = PageController();
  int pageIndex = 1;
  List<Widget> pageList = <Widget>[
    NotificationPage(),
    HomePage(),
    ProfilePage(),
    NotificationPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: AppColor.kPrimaryColor,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
            )
          ],
        ),
        drawer: NavDrawerWidget(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (value) {
            //change page
            setState(() {
              pageIndex = value;
            });
            pageController.animateToPage(pageIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
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
        body: Column(children: <Widget>[
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
          const SizedBox(height: 10),
        ]));
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
}
