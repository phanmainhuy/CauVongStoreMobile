import 'package:cauvongstore_mobile/src/screen/login/login_page.dart';
import 'package:flutter/material.dart';

// import 'base/di/locator.dart';
import 'resources/app_color.dart';

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primaryColor: AppColor.yellow,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage());
  }
}
