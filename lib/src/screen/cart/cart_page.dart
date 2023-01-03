import 'package:cauvongstore_mobile/src/utils/money_format.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  MoneyFormat format = MoneyFormat();
  String _money = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'This is cart page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
