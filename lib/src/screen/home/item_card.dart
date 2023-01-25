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
                        widget.numberBuy = widget.numberBuy + 1;
                        print('numberBuy: ');
                        print(widget.numberBuy);
                      });
                    },
                    child: Text(
                      "mua".toUpperCase(),
                      style: const TextStyle(
                          color: AppColor.kPrimaryColor, fontSize: 17),
                    ),
                  )
                // : Text(widget.numberBuy.toString()),
                : Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.numberBuy--;
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: AppColor.kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          widget.numberBuy.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.numberBuy++;
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: AppColor.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
