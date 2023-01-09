import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:flutter/material.dart';

class PromotionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotion'),
        backgroundColor: AppColor.kPrimaryColor,
      ),
      body: const Center(
        child: Text('Promotion Page'),
      ),
    );
  }
}
