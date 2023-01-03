import 'package:cauvongstore_mobile/src/components/my_button.dart';
import 'package:cauvongstore_mobile/src/model/cart_product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/utils/money_format.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

List<CartProductModel> carts = [];

class _CartPageState extends State<CartPage> {
  MoneyFormat format = MoneyFormat();
  String _money = "";

  List<CartProductModel> _cart = <CartProductModel>[];
  @override
  void initState() {
    super.initState();
    _createCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng của bạn'),
        backgroundColor: AppColor.kPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(child: _buildCard),
          _buildButton(context),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget get _buildCard => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Card(
          elevation: 4.0,
          child: ListView.separated(
            itemCount: 1,
            separatorBuilder: (_, index) => const SizedBox(height: 15),
            itemBuilder: (_, index) => ListTile(
                leading: Image.network(
                  _cart[index].image,
                  width: 70,
                  height: 70,
                ),
                title: Text(_cart[index].name),
                subtitle: Text(_cart[index].price?.toString() ?? ''),
                trailing: IconButton(
                  onPressed: () {
                    // context.read<CartProvider>().removeCart(index);
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.grey,
                  ),
                )),
          ),
        ),
      );

  Widget _buildButton(BuildContext context) => Column(
        children: [
          const SizedBox(height: 10),
          // _buildTotal,
          const SizedBox(height: 10),
          MyButton(
            name: "Đặt hàng",
            // onPressed: context.read<CartProvider>().payment,
            onPressed: () {},
          ),
          // const SizedBox(height: 10),
          // MyButton(
          //   name: "Quay về trang chủ",
          //   onPressed: Navigator.of(context).pop,
          // ),
        ],
      );
  //Set cung data
  void _createCartData() {
    var list = <CartProductModel>[
      CartProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
          // icon: Icons.coffee,
          // color: Colors.brown,
          id: '123',
          image:
              'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
          userId: '123123',
          price: 10000),
    ];
    setState(() {
      _cart = list;
    });
  }
}
