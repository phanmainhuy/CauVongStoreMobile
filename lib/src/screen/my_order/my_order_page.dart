import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin tài khoản'),
        backgroundColor: AppColor.kPrimaryColor,
      ),
      body: _MyOrderPage(),
    );
  }
}

class _MyOrderPage extends StatefulWidget {
  const _MyOrderPage({super.key});

  @override
  State<_MyOrderPage> createState() => __MyOrderPageState();
}

class __MyOrderPageState extends State<_MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(),
    );
  }
}
