import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/screen/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'body.dart';

class DetailPage extends StatelessWidget {
  final ProductModel product;

  const DetailPage({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      appBar: buildAppBar(context),
      body: Body(product: product),
      // add products from category
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Chi tiết sản phẩm'),
      backgroundColor: AppColor.kPrimaryColor,
      elevation: 0,
      // leading: IconButton(
      //   icon: SvgPicture.asset(
      //     'assets/icons/back.svg',
      //     color: Colors.white,
      //   ),
      //   onPressed: () => Navigator.pop(context),
      // ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
