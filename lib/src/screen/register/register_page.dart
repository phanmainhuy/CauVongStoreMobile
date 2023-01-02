import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';
import '../../resources/app_color.dart';
import '../../resources/app_drawable.dart';
import '../../utils/validator.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _RegisterPage();
  }
}

class _RegisterPage extends StatelessWidget {
  const _RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                AppDrawable.logo(width: size.width * 0.60),
                const SizedBox(height: 10),
                const Text(
                  "ĐĂNG KÝ TÀI KHOẢN\nCỬA HÀNG CẦU VÒNG",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColor.blue),
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: SingleChildScrollView(
                  child: _buildRegisterForm(context),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildInputRegisterForm(context),
        _buildRegisterButton(context),
        const SizedBox(height: 10),
        _buildCancelButton(context),
      ],
    );
  }

  Widget _buildInputRegisterForm(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 330,
          child: RoundedInputField(
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
        const SizedBox(height: 10),
        SizedBox(
          width: 330,
          child: RoundedInputField(
            icon: Icons.email,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phải nhập địa chỉ email';
              }

              if (!Validator.email(value)) {
                return 'Địa chỉ email sai định dạng';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 330,
          child: MyPasswordField(
            hintText: 'Mật khẩu',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phải nhập mật khẩu';
              }

              if (value.length < 8) {
                return 'Mật khẩu phải lớn hơn 8 kí tự';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 330,
          child: RoundedInputField(
            icon: Icons.phone,
            hintText: "Số điện thoại",
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phải nhập số điện thoại';
              }

              if (value.length != 10) {
                return 'Số điện thoai phải 10 kí tự';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 330,
          child: RoundedInputField(
            icon: Icons.add_location,
            hintText: "Địa chỉ",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phải nhập địa chỉ';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildCancelButton(BuildContext context) => SizedBox(
        width: 330,
        height: 50,
        child: ElevatedButton(
          child: Text("HỦY BỎ".toUpperCase(),
              style: const TextStyle(fontSize: 15)),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(15)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(AppColor.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19.0),
                      side: const BorderSide(color: Colors.white)))),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginPage();
                },
              ),
            );
          },
        ),
      );

  Widget _buildRegisterButton(BuildContext context) => SizedBox(
        width: 330,
        height: 50,
        child: ElevatedButton(
          child: Text("Đăng ký tài khoản".toUpperCase(),
              style: const TextStyle(fontSize: 15)),
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(15)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(AppColor.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19.0),
                      side: const BorderSide(color: Colors.white)))),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      );
}
