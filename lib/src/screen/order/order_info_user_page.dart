import 'package:cauvongstore_mobile/src/components/my_button.dart';
import 'package:cauvongstore_mobile/src/components/rounded_input_field.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/screen/order_successful/order_successful_page.dart';
import 'package:flutter/material.dart';

class OrderInfoUserPage extends StatefulWidget {
  const OrderInfoUserPage({super.key});

  @override
  State<OrderInfoUserPage> createState() => _OrderInfoUserPageState();
}

class _OrderInfoUserPageState extends State<OrderInfoUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Xác nhận thông tin người nhận hàng'),
      ),
      body: SafeArea(
        child: Form(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 5),
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildOrderInfoUserPageForm(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderInfoUserPageForm(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Họ và tên người đặt",
          textAlign: TextAlign.center,
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 370,
          child: RoundedInputField(
            // controller: context.read<EditCustomerProvider>().nameCtr,
            icon: Icons.person,
            hintText: "Họ và tên",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phải nhập họ và tên';
              }

              if (value.length < 6) {
                return 'Họ và tên phải lớn hơn 6 kí tự';
              }

              return null;
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Địa chỉ",
          textAlign: TextAlign.center,
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 370,
          child: RoundedInputField(
            icon: Icons.location_on,
            hintText: "Địa chỉ",
            // controller: context.read<EditCustomerProvider>().addressCtr,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phải nhập địa chỉ';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Số điện thoại",
          textAlign: TextAlign.center,
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 370,
          child: RoundedInputField(
            icon: Icons.phone,
            length: 10,
            hintText: "Số điện thoại",
            // controller: context.read<EditCustomerProvider>().phoneCtr,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phải nhập so dien thoai';
              }

              if (value.length < 6) {
                return 'so dien thoai phải lớn hơn 10 kí tự';
              }

              return null;
            },
          ),
        ),
        const Text(
          "Ghi chú",
          textAlign: TextAlign.center,
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 370,
          child: RoundedInputField(
            icon: Icons.note,
            hintText: "Ghi chú",
            // controller: context.read<EditCustomerProvider>().noteCtr,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: 370,
          child: MyButton(
            name: "Tiến hành đặt hàng",
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderSuccessfulPage(),
                ),
              ),
            },
          ),
        ),
      ],
    );
  }
}
