import 'package:cauvongstore_mobile/src/components/my_button.dart';
import 'package:cauvongstore_mobile/src/model/cart_product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/screen/order/order_page.dart';
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
  String _money = '100000';
  MoneyFormat _moneyFormat = MoneyFormat();

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
          Expanded(
            child: _buildCard,
            flex: 9,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: _buildTotal('10000'),
            ),
            flex: 1,
          ),
          _buildButtonPurchase(context),
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
              subtitle: Text(_moneyFormat
                      .moneyFormat(_cart[index].price?.toString() ?? '') +
                  ' VND'),
              trailing: IconButton(
                onPressed: () {
                  // context.read<CartProvider>().removeCart(index);
                },
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildButtonPurchase(BuildContext context) => Column(
        children: [
          MyButton(
            name: "Đặt hàng",
            height: 50,
            // onPressed: context.read<CartProvider>().payment,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderPage(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );

  Widget _buildTotal(String totalPrice) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              format.moneyFormat(totalPrice) + ' VND',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
            ),
          ],
        ),
      );

  //Set cung data
  void _createCartData() {
    var list = <CartProductModel>[
      CartProductModel(
          name: 'Lốc 4 hộp sữa dinh dưỡng',
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
