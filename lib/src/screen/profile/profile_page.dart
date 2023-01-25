import 'package:cauvongstore_mobile/src/screen/edit_profile/edit_profile_page.dart';
import 'package:cauvongstore_mobile/src/screen/login/login_page.dart';
import 'package:flutter/material.dart';
import '../../components/my_button.dart';
import '../../resources/app_color.dart';
import '../../resources/app_drawable.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin tài khoản'),
        backgroundColor: AppColor.kPrimaryColor,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              AppDrawable.logo(width: size.width * 0.35),
              const Text(
                'Phan Mai Như Ý',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 230,
                          height: 50,
                          child: Text(
                            'Phan Mai Như Ý',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 230,
                          height: 50,
                          child: Text(
                            'phanmainhuy@gmail.com',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 230,
                          height: 50,
                          child: Text(
                            '0948462040',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 75,
                          height: 50,
                          child: Text(
                            'Address',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 230,
                          height: 50,
                          child: Text(
                            'Tân Bình',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    MyButton(
                      name: "Sửa thông tin",
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(),
                          ),
                        ),
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyButton(
                      name: "Đăng xuất",
                      onPressed: () => {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ))
                      },
                    ),
                  ],
                ),

                // const Text(
                //   'Test',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                //build profile
              ),
            ],
          ),
        ),
      ),
    );
  }
}
