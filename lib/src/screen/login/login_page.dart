import 'package:cauvongstore_mobile/src/components/rounded_input_field.dart';
import 'package:cauvongstore_mobile/src/components/rounded_password_field.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/app_drawable.dart';
import 'package:cauvongstore_mobile/src/screen/home/main_page.dart';
import 'package:cauvongstore_mobile/src/utils/validator.dart';
import 'package:flutter/material.dart';

import '../register/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  // TextEditingController password;
  // TextEditingController email;
  // GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            // key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppDrawable.logo(width: size.width * 0.60),
                const SizedBox(height: 10),
                const Text(
                  "CỬA HÀNG CẦU VÒNG",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColor.blue),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 330,
                  child: RoundedInputField(
                    icon: Icons.person,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email hoặc số điện thoại",
                    // controller: email,
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
                const SizedBox(height: 20),
                SizedBox(
                  width: 330,
                  child: MyPasswordField(
                    hintText: 'Mật khẩu',
                    // controller: password,
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
                buildRememberPassword(),
                const SizedBox(height: 10),
                buildLoginButton(),
                const SizedBox(height: 10),
                SizedBox(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    child: Text("Đăng ký tài khoản".toUpperCase(),
                        style: const TextStyle(fontSize: 15)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColor.blue),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                                side: const BorderSide(color: Colors.white)))),
                    onPressed: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RegisterPage();
                          },
                        ),
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class buildRememberPassword extends StatefulWidget {
  const buildRememberPassword({Key? key}) : super(key: key);

  @override
  State<buildRememberPassword> createState() => _buildRememberPasswordState();
}

class _buildRememberPasswordState extends State<buildRememberPassword> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CheckBoxRemember(
            value: true,
            // onChanged: ,
          ),
          const Text('Lưu mật khẩu'),
        ],
      ),
    );
  }
}

class CheckBoxRemember extends StatelessWidget {
  // final VoidCallback onChanged;
  final bool value;

  const CheckBoxRemember(
      {Key? key,
      // final ValueChanged<bool>? onChanged;
      this.value = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }

      return AppColor.blue;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: value, onChanged: (bool? value) {},
      // onChanged?.call(value ?? false);
    );
  }
}

class buildLoginButton extends StatelessWidget {
  buildLoginButton({Key? key}) : super(key: key);
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 330,
        height: 50,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                child: Text("Đăng nhập".toUpperCase(),
                    style: const TextStyle(fontSize: 15)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(15)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColor.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.0),
                            side: const BorderSide(color: Colors.white)))),
                onPressed: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainPage()))
                },
              ));
  }
}
