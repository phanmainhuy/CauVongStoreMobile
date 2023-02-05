import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/screen/home/home_page.dart';
import 'package:cauvongstore_mobile/src/screen/main/main_page.dart';
import 'package:flutter/material.dart';

class OrderSuccessfulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => MainPage()), (_) => false);
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
              'Đặt hàng thành công\nVui lòng kiểm tra lại đơn hàng đã đặt trong mục \nĐơn hàng của bạn',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
