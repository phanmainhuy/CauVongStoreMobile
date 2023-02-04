import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/screen/home/home_page.dart';
import 'package:flutter/material.dart';

class OrderSuccessfulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // title: const Text('Notification'),
          backgroundColor: AppColor.kPrimaryColor,
        ),
        body: SafeArea(
          child: Center(
            child: Text(
              'Đặt hàng thành công, vui lòng kiểm tra lại đơn hàng đã đặt trong mục Đơn hàng của bạn',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
