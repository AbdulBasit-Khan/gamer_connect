import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/google_btn.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/Auth/forget_password_screen1.dart';
import 'package:gamerconnect/View/Auth/signup_screen.dart';
import 'package:gamerconnect/root_screen.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Center(
          child: Text("Hi, Welcome back" , style: TextUtils.heading1,),

        ),
        SizedBox(height: media.height * 0.03,),
        TextFormField(
      style: TextStyle(color: AppColor.black),
      controller: emailcontroller,
      cursorColor: AppColor.black,
          decoration: InputDecoration(
            contentPadding:const EdgeInsets.symmetric(vertical:  10 , horizontal: 20),
            labelText: 'Email Address',
            labelStyle: TextUtils.body16,
            suffixIcon: Icon(Icons.alternate_email , color: AppColor.black,),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),

            ),
border:OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)
                ),
                
                fillColor: Colors.grey.shade300,
                filled: true
          ),
        ),
        // ReuseTextForm(controller: emailcontroller, hinttext: 'Email Address', icondata: ),
        SizedBox(height: media.height * 0.03,),
        TextFormField(
          obscureText: true,
      style: TextStyle(color: AppColor.black),
      controller: emailcontroller,
      cursorColor: AppColor.black,
          decoration: InputDecoration(
            contentPadding:const EdgeInsets.symmetric(vertical:  10 , horizontal: 20),
            labelText: 'Password',
            labelStyle: TextUtils.body16,
            suffixIcon: Icon(Icons.password , color: AppColor.black,),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),

            ),
border:OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)
                ),
                
                fillColor: Colors.grey.shade300,
                filled: true
          ),
        ),
                SizedBox(height: media.height * 0.02,),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        //     Row(
        //       children: [
        //         Checkbox(value: true, onChanged: (val){}),
        //         Text('Remember me' , style: TextUtils.body14,)
        //       ],
        //     ),
            InkWell(
              onTap: () {
                Navigator.push(context, PageTransition(child:const ForgetPasswordScreenOne(), type: PageTransitionType.fade));
              },
              child: Text('Forget Password' , style: TextUtils.linktext,))
          ],
        ),
       Reusebtn(title: "Login", ontap: (){
        Navigator.push(context, PageTransition(child:const RootScreen(), type: PageTransitionType.fade));
       },),
        SizedBox(height: media.height * 0.03,),
       Row(
        children: [
          const Expanded(child: Divider()) ,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('OR' ,style: TextUtils.body18,),
          ),
         const Expanded(child: Divider()) ,
        ],
       ),
       
      //  SizedBox(height: media.width *.1,),
      //  const GoogleSignUpBtn(image: 'assets/google.png',title: "LogIn with Google",),
       SizedBox(height: media.width *.03,),
       Align(
        alignment: Alignment.bottomCenter,
         child: RichText(
           text: TextSpan(
             text: "Don't have an Account ? ", // First part
             style: TextUtils.body16,
             children: [
               TextSpan(
          text: "Sign Up", // Second part
          recognizer: TapGestureRecognizer()..onTap = (){
            Navigator.push(
           context,
           PageTransition(
             type: PageTransitionType.fade,
             child:const SignUpScreen(),
           ),
         );
          },
          style: TextUtils.linktext
               ),
             ],
           ),
         ),
       )
          ],
        ),
      ),
    );
  }
}
