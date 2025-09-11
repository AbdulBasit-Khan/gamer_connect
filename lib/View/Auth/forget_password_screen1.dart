import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/Auth/resetpassword_screen.dart';
import 'package:page_transition/page_transition.dart';
class ForgetPasswordScreenOne extends StatefulWidget {
  const ForgetPasswordScreenOne({super.key});

  @override
  State<ForgetPasswordScreenOne> createState() => _ForgetPasswordScreenOneState();
}

class _ForgetPasswordScreenOneState extends State<ForgetPasswordScreenOne> {
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: media.height * 0.06,),
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
              
              
              SizedBox(height: media.height * 0.02,),
              Text('''please enter your Email Address .you will receive a link to create a new password via email''',
              textAlign: TextAlign.center,
              style: TextUtils.body14,
              ),
              SizedBox(height: media.height * 0.04,),
              ReuseTextForm(controller: emailcontroller, hinttext: 'Email Address', icondata: Icons.alternate_email),
              SizedBox(height: media.height * 0.02,),
            Reusebtn(title: "SEND", ontap: (){
              Navigator.push(context, PageTransition(child: const ResetPasswordScreen(), type: PageTransitionType.rightToLeft));
            })
            ],
          ),
        ),
      ),
    );
  }
}