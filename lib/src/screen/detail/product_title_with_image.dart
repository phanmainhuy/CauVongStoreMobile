import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductDataModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(
          //   "Aristocratic Hand Bag",
          //   style: TextStyle(color: Colors.black),
          // ),
          // Text(
          //   product.name,
          //   style: Theme.of(context)
          //       .textTheme
          //       .headline4
          //       ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: kDefaultPaddin),
          // Row(
          //   children: <Widget>[
          //     RichText(
          //       text: TextSpan(
          //         children: [
          //           TextSpan(text: "Price\n"),
          //           TextSpan(
          //             text: "\$${product.price}",
          //             style: Theme.of(context).textTheme.headline4?.copyWith(
          //                 color: Colors.black, fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //     ),
          // Expanded(
          Hero(
            tag: "${product.id}",
            child: Image.network(
              product.image,
              fit: BoxFit.fill,
            ),
            // ),
          ),
          const SizedBox(width: kDefaultPaddin),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "\n"),
                TextSpan(
                  text: "${product.name}\n",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // )
        ],
      ),
    );
  }
}
