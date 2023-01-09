import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? press;
  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: product.id,
                child: Image.network(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.name,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Text(
            "${product.price}đ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  // padding: MaterialStateProperty.all<EdgeInsets>(
                  //     const EdgeInsets.all(15)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(AppColor.kPrimaryColor),
                  // backgroundColor: MaterialStateProperty.all<Color>(AppColor.blue),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                          side: const BorderSide(
                              color: AppColor.kPrimaryColor)))),
              onPressed: () {},
              child: Text(
                "mua".toUpperCase(),
                style: const TextStyle(
                    color: AppColor.kPrimaryColor, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
