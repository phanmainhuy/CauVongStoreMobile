import 'package:cauvongstore_mobile/src/components/my_button.dart';
import 'package:cauvongstore_mobile/src/model/cart_product_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/utils/money_format.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Xác nhận đơn hàng'),
      ),
      body: const _OrderPage(),
    );
  }
}

class _OrderPage extends StatefulWidget {
  const _OrderPage({super.key});

  @override
  State<_OrderPage> createState() => __OrderPageState();
}

class __OrderPageState extends State<_OrderPage> {
  List<CartProductModel> _cart = <CartProductModel>[];
  MoneyFormat _moneyFormat = MoneyFormat();

  @override
  void initState() {
    super.initState();
    _createCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }

  Widget _buildButtonPurchase(BuildContext context) => Column(
        children: [
          MyButton(
            name: "Xác nhận đặt hàng",
            height: 50,
            // onPressed: context.read<CartProvider>().payment,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const OrderPage(),
              //   ),
              // );
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
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
              subtitle: Text(
                  'Giá: ${_moneyFormat.moneyFormat(_cart[index].price?.toString() ?? '')} VND'),
              trailing: Text('Số lượng: ${_cart[index].total ?? 0}'),
              // trailing: IconButton(
              //   onPressed: () {
              //     // context.read<CartProvider>().removeCart(index);
              //   },
              //   icon: const Icon(
              //     Icons.add_circle,
              //     color: Colors.grey,
              //   ),
              // ),
            ),
          ),
        ),
      );

  Widget _buildTotal(String totalPrice) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Tổng tiền",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              _moneyFormat.moneyFormat(totalPrice) + ' VND',
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
        total: 10,
        name: 'Lốc 4 hộp sữa dinh dưỡng',
        id: '123',
        image:
            'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
        userId: '123123',
        price: 10000,
      ),
      CartProductModel(
        total: 10,
        name: 'Lốc 4 hộp sữa dinh dưỡng',
        id: '123',
        image:
            'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
        userId: '123123',
        price: 10000,
      ),
      CartProductModel(
        total: 10,
        name: 'Lốc 4 hộp sữa dinh dưỡng',
        id: '123',
        image:
            'https://cdn.tgdd.vn/Products/Images/2386/80493/bhx/loc-4-hop-sua-tuoi-tiet-trung-khong-duong-dutch-lady-180ml-202104150826346937.jpg',
        userId: '123123',
        price: 10000,
      ),
    ];
    setState(() {
      _cart = list;
    });
  }
}
