import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:flutter/material.dart';

class MyLittleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String name;

  const MyLittleButton({required this.name, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 50,
      child: ElevatedButton(
        child: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        style: ButtonStyle(
            // padding: MaterialStateProperty.all<EdgeInsets>(
            //     const EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            // backgroundColor: MaterialStateProperty.all<Color>(AppColor.blue),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColor.kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19.0),
                    side: const BorderSide(color: Colors.white)))),
        onPressed: onPressed,
      ),
    );
  }
}
