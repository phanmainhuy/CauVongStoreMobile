import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:cauvongstore_mobile/src/screen/login/login_page.dart';
import 'package:cauvongstore_mobile/src/screen/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/app_color.dart';

class NavDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          //statusBarColor: Colors.black,
          // For Android.
          // Use [light] for white status bar and [dark] for black status bar.
          statusBarIconBrightness: Brightness.light,
          // For iOS.
          // Use [dark] for white status bar and [light] for black status bar.
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
        ),
        child: Material(
          color: AppColor.kPrimaryColor,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    // gradient: LinearGradient (colors: <Color>[
                    //   Colors.white,
                    //   Colors.blueGrey,
                    // ])
                    color: Colors.white,
                  ),
                  child: Text(
                    'Cửa hàng cầu vòng',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              buildMenuItem(
                text: 'Login',
                icon: Icons.car_repair,
                onClicked: () => selectedItem(context, 0),
              ),
              // //const SizedBox (height: 20),
              buildMenuItem(
                text: "Profile",
                icon: Icons.account_balance_outlined,
                onClicked: () => selectedItem(context, 1),
              ),
              buildMenuItem(
                  text: 'Cart',
                  icon: Icons.shopping_cart,
                  onClicked: () => selectedItem(context, 2)),
              SizedBox(
                height: 2.0,
                child: Center(
                  child: Container(
                    margin:
                        const EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 5.0,
                    color: Colors.white70,
                  ),
                ),
              ),
              buildMenuItem(
                text: "Logout",
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 9),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: const TextStyle(
            fontSize: FontSizeText.fontPriceSize,
            color: color,
          )),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CartPage(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      break;
    case 7:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      break;
    case 8:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      break;
    case 9:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
      break;
  }
}
