import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class SearchBarText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;  // Add onChanged as a parameter

  const SearchBarText({
    super.key, 
    required this.controller, 
    required this.hintText,
    required this.onChanged, // Accept the onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextUtils.body16,
      controller: controller,
      // cursorColor: AppColor.whiteColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextUtils.body18,
        focusColor: AppColor.greyColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        // Focused border
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        // Default border color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.greyColor),
        ),
      ),
      onChanged: onChanged,  // Set the onChanged callback here
    );
  }
}
