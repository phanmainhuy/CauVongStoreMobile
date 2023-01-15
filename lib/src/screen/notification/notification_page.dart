import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        backgroundColor: AppColor.kPrimaryColor,
      ),
      body: const Center(
        child: Text('Bạn chưa có thông báo nào',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
