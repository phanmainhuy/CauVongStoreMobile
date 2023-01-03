import 'package:cauvongstore_mobile/src/components/my_button.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
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
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
        backgroundColor: AppColor.kPrimaryColor,
      ),
      body: Column(
        children: [
          // Expanded(child: _buildCard),
          _buildButton(context),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) => Column(
        children: [
          const SizedBox(height: 10),
          // _buildTotal,
          const SizedBox(height: 10),
          // _buildPayButton,
          const SizedBox(height: 10),
          MyButton(
            name: "Quay về trang chủ",
            onPressed: Navigator.of(context).pop,
          ),
        ],
      );
}
