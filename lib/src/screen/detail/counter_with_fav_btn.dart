import 'package:cauvongstore_mobile/src/screen/detail/cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CartCounter(),
        // Container(
        //   padding: EdgeInsets.all(8),
        //   height: 32,
        //   width: 32,
        //   decoration: const BoxDecoration(
        //     color: Color(0xFFFF6464),
        //     shape: BoxShape.circle,
        //   ),
        //   child: SvgPicture.asset("assets/icons/heart.svg"),
        // )
      ],
    );
  }
}
