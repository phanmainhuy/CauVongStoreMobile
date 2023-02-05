import 'package:cauvongstore_mobile/src/model/cart_product_model.dart';
import 'package:cauvongstore_mobile/src/model/product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/const.dart';
import 'package:cauvongstore_mobile/src/utils/money_format.dart';
import 'package:flutter/material.dart';

class ItemCardCart extends StatefulWidget {
  final CartProductModel cart;
  final VoidCallback? press;
  int numberBuy = 0;
  MoneyFormat _moneyFormat = MoneyFormat();
  ItemCardCart({super.key, required this.cart, this.press});

  @override
  State<ItemCardCart> createState() => _ItemCardCartState();
}

class _ItemCardCartState extends State<ItemCardCart> {
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
                tag: widget.cart.id,
                child: Image.network(widget.cart.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              widget.cart.name,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Text(
            widget._moneyFormat.moneyFormat('${widget.cart.price}') + ' VND',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontSizeText.fontNormalSize,
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
                          fontSize: FontSizeText.fontNormalSize),
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
                            fontSize: FontSizeText.fontNormalSize,
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
