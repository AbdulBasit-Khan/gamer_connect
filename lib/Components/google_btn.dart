import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class GoogleSignUpBtn extends StatelessWidget {
  final String  image;
  final String title; 
  const GoogleSignUpBtn({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.btnColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(width: media.width *0.03,),
            Text(title , style: TextUtils.heading4,)
          ],
        ),
       );
  }
}