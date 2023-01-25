import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Categories Page'),
      ),
      body: const Center(
        child: Text('Categories Page'),
      ),
    );
  }
}
