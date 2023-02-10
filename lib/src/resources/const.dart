import 'package:flutter/material.dart';

const kDefaultPaddin = 20.0;

class Const {
  static const String apiAddress = "https://cuahangcauvong.com/be/api";
  static const String imgLogoNetwork =
      'https://cauvong.s3.ap-southeast-1.amazonaws.com/%5BChen+vao+anh%5D+logo+cau+vong-01.png';
  static const String imgLogoAssets = 'assets/images/logo.png';
}

class FontSizeText {
  static const double fontLargeSize = 20.0;
  static const double fontNormalSize = 17.0;
  static const double fontSmallSize = 12.0;
}

class MyDeviceUI {
  BuildContext context;

  MyDeviceUI(this.context) : assert(context != null);

  double get deviceWidth => MediaQuery.of(context).size.width;
  double get deviceHeight => MediaQuery.of(context).size.height;
  Size get size => MediaQuery.of(context).size;
}

class ResultStatus {
  int statusCode;
  dynamic data;

  ResultStatus({required this.statusCode, this.data});

  factory ResultStatus.fromData(int code, [dynamic data]) {
    return ResultStatus(statusCode: code, data: data);
  }
}
