import 'package:cauvongstore_mobile/src/components/my_button.dart';
import 'package:cauvongstore_mobile/src/components/rounded_calendar_input_field.dart';
import 'package:cauvongstore_mobile/src/components/rounded_input_field.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';
import 'package:cauvongstore_mobile/src/screen/change_password/change_password_page.dart';
import 'package:cauvongstore_mobile/src/screen/profile/profile_page.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: const Text('Sửa thông tin tài khoản'),
      ),
      body: _EditProfilePage(),
    );
  }
}

class _EditProfilePage extends StatefulWidget {
  const _EditProfilePage({super.key});

  @override
  State<_EditProfilePage> createState() => __EditProfilePageState();
}

class __EditProfilePageState extends State<_EditProfilePage> {
  String birthdayCtr = "";
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
        const Text(
          "Họ",
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
            hintText: "Họ",
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
          "Tên",
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
            hintText: "Tên",
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
          "Email",
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
            icon: Icons.email,
            hintText: "Email",
            // controller: context.read<EditCustomerProvider>().noteCtr,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Ngày sinh",
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
          child: RoundedCalendarInputField(
            icon: Icons.calendar_today,
            hintText: "Ngày sinh",
            // controller: context.read<EditCustomerProvider>().birthdayCtr,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng chọn ngày sinh';
              }
              return null;
            },
            onTap: () {
              _selectDate(context);
            },
            onChange: (String value) {
              _selectDate(context);
              value = birthdayCtr;
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: 370,
          child: MyButton(
            name: "Đổi mật khẩu",
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePasswordPage(),
                ),
              ),
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 370,
          child: MyButton(
            name: "Lưu thông tin",
            onPressed: () => {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              ),
            },
          ),
        ),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    int firstYear = now.year - 100;
    int lastYear = now.year - 18;
    DateTime selectedDate = DateTime(lastYear);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(firstYear),
      lastDate: DateTime(lastYear),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
        // context.read<EditCustomerProvider>().birthdayCtr.text = formattedDate;
      });
    }
  }
}
