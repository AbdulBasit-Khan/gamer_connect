import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class ReuseTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final IconData? icondata;
  final bool? obscure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator; // Accept validator
  const ReuseTextForm({
    super.key,
    required this.controller,
    required this.hinttext,
    this.icondata,
    this.validator,
    this.obscure = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColor.black),
      controller: controller,
      obscureText: obscure!,
      validator: validator,
      keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
      cursorColor: AppColor.black,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        labelText: hinttext,
        labelStyle: TextUtils.body16,
        suffixIcon: Icon(icondata, color: AppColor.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),

        fillColor: Colors.grey.shade300,
        filled: true,
      ),
    );
  }
}
