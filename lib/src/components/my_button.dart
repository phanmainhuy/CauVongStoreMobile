import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:flutter/material.dart';

import '../resources/app_color.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String name;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;

  const MyButton(
      {required this.name,
      this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            // padding: MaterialStateProperty.all<EdgeInsets>(
            //     const EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            // backgroundColor: MaterialStateProperty.all<Color>(AppColor.blue),
            backgroundColor: MaterialStateProperty.all<Color>(
                backgroundColor ?? AppColor.kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19.0),
                    side: const BorderSide(color: Colors.white)))),
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: FontSizeText.fontNormalSize),
        ),
      ),
    );
  }
}
