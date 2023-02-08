import 'package:flutter/material.dart';
import 'package:cauvongstore_mobile/src/resources/app_color.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validator;
  final IconData icon;
  final TextInputType? keyboardType;
  final int? length;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.length,
    this.onChange,
    this.controller,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: length,
      cursorColor: AppColor.blue,
      validator: validator,
      onChanged: onChange,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          icon,
          color: AppColor.blue,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(200)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(200)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 0),
            borderRadius: BorderRadius.circular(200)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 0),
            borderRadius: BorderRadius.circular(200)),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 0),
          borderRadius: BorderRadius.circular(200),
        ),
      ),
    );
  }
}
