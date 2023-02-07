import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/splash/splash_page.dart';
import 'package:flutter/material.dart';

// import 'base/di/locator.dart';
import 'resources/app_color.dart';

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  MyApp({Key? key}) : super(key: key);

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this._calculation,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            theme: ThemeData(
              primaryColor: AppColor.yellow,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
