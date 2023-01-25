import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Sửa thông tin tài khoản'),
      ),
      body: const Center(
        child: Text('Edit Profile Page'),
      ),
    );
  }
}
