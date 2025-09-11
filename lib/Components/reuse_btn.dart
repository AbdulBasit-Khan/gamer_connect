import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class Reusebtn extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const Reusebtn({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.btnColor,
            borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text(title , style: TextUtils.body19,),),
          ),
    );
  }
}