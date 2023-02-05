import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:flutter/material.dart';

class AppDrawable {
  static logo({double? width, double? height}) =>
      Image.network(Const.imgLogoNetwork, width: width, height: height);

  static user({double? width}) => Image.asset(
        "assets/images/nguoidung/Cc.png",
        width: width,
      );

  static const userAssetImage = AssetImage("assets/images/nguoidung/Cc.png");
}
