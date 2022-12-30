import 'package:flutter/material.dart';

import '../../resources/app_color.dart';
import '../notification/notification_page.dart';
import '../profile/profile_page.dart';
import 'nav_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int pageIndex =1;
  List<Widget> pageList = <Widget>[
    NotificationPage(),
    HomePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: AppColor.kPrimaryColor,
      ),
      drawer: NavDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (value) {//change page
            setState((){
              pageIndex = value;
            });
            pageController.animateToPage(pageIndex, duration: const Duration(milliseconds: 500),curve: Curves.easeIn);
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
            icon: Icon(Icons.pages),
            label: "Promotion",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
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
      // body: _buildCard(),
    );
  }
}
