import 'package:cauvongstore_mobile/src/components/rounded_input_field.dart';
import 'package:cauvongstore_mobile/src/components/rounded_password_field.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/app_drawable.dart';
import 'package:cauvongstore_mobile/src/screen/login/login_page.dart';
import 'package:cauvongstore_mobile/src/screen/main/main_page.dart';
import 'package:cauvongstore_mobile/src/utils/validator.dart';
import 'package:flutter/material.dart';

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
                const SizedBox(height: 10),
                AppDrawable.logo(width: size.width * 0.60),
                const Text(
                  "ĐĂNG KÝ TÀI KHOẢN",
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
            icon: Icons.account_circle_rounded,
            hintText: "Tên",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập tên';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 330,
          child: RoundedInputField(
            icon: Icons.account_circle_rounded,
            hintText: "Họ",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập họ';
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
                return 'Vui lòng nhập số điện thoại';
              }

              if (value.length != 10) {
                return 'Số điện thoại phải 10 kí tự';
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
                return 'Vui lòng nhập mật khẩu';
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
          child: MyPasswordField(
            hintText: 'Nhập lại mật khẩu',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập mật khẩu';
              }

              if (value.length < 8) {
                return 'Mật khẩu phải lớn hơn 8 kí tự';
              }

              return null;
            },
          ),
        ),
        const SizedBox(height: 30),
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
                  return LoginPage();
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
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
        ),
      );
}
