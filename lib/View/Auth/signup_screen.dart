import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/google_btn.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/Auth/login_screen.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();
  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: fKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Text("Create An Account", style: TextUtils.heading1),
                  ),
                  Center(
                    child: Text(
                      "Connects with your friends today",
                      style: TextUtils.body14,
                    ),
                  ),
                  SizedBox(height: media.height * 0.03),
                  ReuseTextForm(
                    controller: namecontroller,
                    hinttext: 'Name',
                    icondata: Icons.person,
                    validator: (val) {
                      if (val!.trim().isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: media.height * 0.015),

                  ReuseTextForm(
                    controller: emailcontroller,
                    hinttext: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    icondata: Icons.alternate_email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }

                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Enter a valid email address';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: media.height * 0.015),

                  ReuseTextForm(
                    controller: phonecontroller,
                    keyboardType: TextInputType.phone,
                    hinttext: 'Phone',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      }

                      final phoneRegex = RegExp(r'^[0-9]{8,}$');

                      if (!phoneRegex.hasMatch(value)) {
                        return 'Enter a valid phone number';
                      }

                      return null;
                    },
                    icondata: Icons.phone,
                  ),

                  SizedBox(height: media.height * 0.015),

                  ReuseTextForm(
                    controller: passwordcontroller,
                    hinttext: 'Password',
                    icondata: Icons.visibility,
                    obscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }

                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: media.height * 0.015),

                  ReuseTextForm(
                    controller: confirmpasscontroller,
                    hinttext: 'Confirm Password',
                    icondata: Icons.visibility,
                    obscure: true,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm Password is required';
                      }

                      if (value != passwordcontroller.text) {
                        return "Passwords don't match";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: media.height * 0.05),
                  Reusebtn(
                    title: "Sign Up",
                    ontap: () {
                      if (fKey.currentState!.validate()) {
                        Provider.of<AuthPro>(context, listen: false).signUp(
                          name: namecontroller.text,
                          email: emailcontroller.text,
                          pass: passwordcontroller.text,
                          phone: phonecontroller.text,
                          context: context,
                        );
                      }
                    },
                  ),
                  SizedBox(height: media.height * 0.03),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('OR', style: TextUtils.body18),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),

                  SizedBox(height: media.width * .03),
                  RichText(
                    text: TextSpan(
                      text: "Already have an Account? ", // First part
                      style: TextUtils.body16,
                      children: [
                        TextSpan(
                          text: "Log In", // Second part
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            },
                          style: TextUtils.linktext,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
