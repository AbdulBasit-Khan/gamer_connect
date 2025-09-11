import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class SearchBarText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const SearchBarText({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return  TextFormField( 
      style: TextUtils.body16,
      controller: controller,
                cursorColor: AppColor.whiteColor,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextUtils.body18,
                  focusColor: AppColor.greyColor,
                  contentPadding:const EdgeInsets.symmetric(
                    vertical: 10 , horizontal: 15),
                 // focussBorder
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.greyColor),
                  borderRadius: BorderRadius.circular(50),
                  ),
                  //default border color
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: AppColor.whiteColor
                    )
                  
                  ),
                ),
              );
  }
}