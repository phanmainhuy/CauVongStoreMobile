import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Order Page'),
      ),
      body: const Center(
        child: Text('Order Page'),
      ),
    );
  }
}
