import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/utils/money_format.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final ProductModel product;
  final VoidCallback? press;
  int numberBuy = 0;
  MoneyFormat _moneyFormat = MoneyFormat();
  ItemCard({super.key, required this.product, this.press});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
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
                tag: widget.product.id,
                child: Image.network(widget.product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              widget.product.name,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Text(
            widget._moneyFormat.moneyFormat('${widget.product.price}') + ' VND',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontSizeText.fontPriceSize,
            ),
          ),
          SizedBox(
            height: 30,
            width: double.infinity,
            child: (widget.numberBuy == 0)
                ? ElevatedButton(
                    style: ButtonStyle(
                        // padding: MaterialStateProperty.all<EdgeInsets>(
                        //     const EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            AppColor.kPrimaryColor),
                        // backgroundColor: MaterialStateProperty.all<Color>(AppColor.blue),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.0),
                                    side: const BorderSide(
                                        color: AppColor.kPrimaryColor)))),
                    onPressed: () {
                      setState(() {
                        widget.numberBuy++;
                      });
                    },
                    child: Text(
                      "mua".toUpperCase(),
                      style: const TextStyle(
                          color: AppColor.kPrimaryColor,
                          fontSize: FontSizeText.fontPriceSize),
                    ),
                  )
                : Row(
                    children: <Widget>[
                      buildOutlineButton(
                        icon: Icons.remove,
                        press: () {
                          setState(() {
                            widget.numberBuy--;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPaddin / 2),
                        child: Text(
                          // if our item is less  then 10 then  it shows 01 02 like that
                          widget.numberBuy.toString(),
                          style: const TextStyle(
                            fontSize: FontSizeText.fontPriceSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      buildOutlineButton(
                          icon: Icons.add,
                          press: () {
                            setState(() {
                              widget.numberBuy++;
                            });
                          }),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  SizedBox buildOutlineButton({IconData? icon, Function()? press}) {
    return SizedBox(
      width: 30,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
