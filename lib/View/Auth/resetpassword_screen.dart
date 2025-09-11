import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: media.height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back , color: AppColor.whiteColor, size: 30,)),
                  SizedBox(width: media.width * 0.03,),
              Text('Forget Password' , style: TextUtils.heading1,),
                ],
              ),
              
             
              SizedBox(height: media.height * 0.04,),
              ReuseTextForm(controller: emailcontroller, hinttext: 'Password', icondata: Icons.visibility_off),
             SizedBox(height: media.height * 0.03,),
              ReuseTextForm(controller: emailcontroller, hinttext: 'Confirm Password', icondata: Icons.visibility_off),
             
              SizedBox(height: media.height * 0.04,),
            Reusebtn(title: "CHANGE PASSWORD", ontap: (){})
            ],
          ),
        ),
      ),
    );
  }
}