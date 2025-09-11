import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class ProfileText extends StatelessWidget {
  final TextEditingController controller ; 
  final String labelText;
  final bool readOnly;
  const ProfileText({super.key, required this.controller, required this.labelText, required this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: controller,
                readOnly: readOnly,
                style: TextUtils.body18,
                cursorColor: AppColor.whiteColor,
               decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                labelText: labelText,
                labelStyle: TextUtils.body16,
              border:InputBorder.none
                
               ),
              );
  }
}