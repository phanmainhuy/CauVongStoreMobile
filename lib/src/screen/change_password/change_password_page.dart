import 'package:cauvongstore_mobile/src/components/my_button.dart';
import 'package:cauvongstore_mobile/src/components/rounded_input_field.dart';
import 'package:cauvongstore_mobile/src/components/rounded_password_field.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Đổi mật khẩu'),
      ),
      body: Center(
        child: _ChangePasswordPage(),
      ),
    );
  }
}

class _ChangePasswordPage extends StatefulWidget {
  const _ChangePasswordPage({super.key});

  @override
  State<_ChangePasswordPage> createState() => __ChangePasswordPageState();
}

class __ChangePasswordPageState extends State<_ChangePasswordPage> {
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _reNewPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildEditProfileForm(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditProfileForm(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 370,
          child: MyPasswordField(
            controller: _oldPassword,
            hintText: 'Mật khẩu cũ',
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
        // SizedBox(
        //   width: 370,
        //   child: FlutterPasswordStrength(
        //       password: _oldPassword.text,
        //       strengthCallback: (strength) {
        //         debugPrint(strength.toString());
        //       }),
        // ),
        const SizedBox(height: 20),
        SizedBox(
          width: 370,
          child: MyPasswordField(
            controller: _newPassword,
            hintText: 'Mật khẩu mới',
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
        const SizedBox(height: 20),
        SizedBox(
          width: 370,
          child: MyPasswordField(
            controller: _reNewPassword,
            hintText: 'Nhập lại mật khẩu mới',
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
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: 370,
          child: MyButton(
            name: "Đổi mật khẩu",
            onPressed: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ,
              //   ),
              // ),
            },
          ),
        ),
      ],
    );
  }
}
