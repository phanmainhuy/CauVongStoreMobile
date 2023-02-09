import 'package:cauvongstore_mobile/src/bloc/login/login_bloc.dart';
import 'package:cauvongstore_mobile/src/bloc/login/login_event.dart';
import 'package:cauvongstore_mobile/src/bloc/login/login_state.dart';
import 'package:cauvongstore_mobile/src/components/rounded_input_field.dart';
import 'package:cauvongstore_mobile/src/components/rounded_password_field.dart';
import 'package:cauvongstore_mobile/src/model/login_model.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/resources/app_dialog.dart';
import 'package:cauvongstore_mobile/src/resources/app_drawable.dart';
import 'package:cauvongstore_mobile/src/screen/main/main_page.dart';
import 'package:cauvongstore_mobile/src/screen/register/register_page.dart';
import 'package:cauvongstore_mobile/src/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  // GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return _LoginPage();
  }
}

class _LoginPage extends StatefulWidget {
  const _LoginPage({Key? key}) : super(key: key);

  @override
  State<_LoginPage> createState() => __LoginPageState();
}

class __LoginPageState extends State<_LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController usernameCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  LoginBloc loginBloc = LoginBloc();
  LoginModel _loginData = LoginModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    loginBloc = LoginBloc();
    super.initState();
    loginBloc.add(LoginInitialEvent());
  }

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginBloc, LoginState>(
        cubit: loginBloc,
        listener: (context, state) async {
          switch (state.runtimeType) {
            case LoginSuccessState:
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainPage();
                    },
                  ),
                );
              }
              break;
            case LoginFailState:
              {
                DispErrorMsg.show(
                    context: context, msg: 'Sai tên đăng nhập hoặc mật khẩu');
              }
              break;
          }
        },
        builder: (context, state) {
          return _bodyLogin(context);
        },
      ),
    );
  }

  _bodyLogin(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppDrawable.logo(width: size.width * 0.60),
              SizedBox(
                width: 330,
                child: RoundedInputField(
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  hintText: "Nhập số điện thoại",
                  controller: usernameCtr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số điện thoại';
                    }
                    if (value.length != 10) {
                      return 'vui lòng nhập chuỗi số gồm 10 ký tư';
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
                  controller: passwordCtr,
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
              SizedBox(
                width: 330,
                height: 50,
                child:
                    // isLoading
                    //     ? const Center(child: CircularProgressIndicator())
                    //     :
                    ElevatedButton(
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
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MainPage(),
                    //   ),
                    // ),
                    onSubmitLogin()
                  },
                  child: Text(
                    "Đăng nhập".toUpperCase(),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 330,
                height: 50,
                child: ElevatedButton(
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    ),
                  },
                  child: Text("Đăng ký tài khoản".toUpperCase(),
                      style: const TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSubmitLogin() {
    if (_formKey.currentState == null) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      _loginData.username = usernameCtr.text;
      _loginData.password = passwordCtr.text;
      loginBloc.add(
          SubmitLogin(username: usernameCtr.text, password: passwordCtr.text));
    } else {
      return;
    }
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
      value: value,
      onChanged: (bool? value) {
        // onChanged?.call(value ?? false);
      },
    );
  }
}
