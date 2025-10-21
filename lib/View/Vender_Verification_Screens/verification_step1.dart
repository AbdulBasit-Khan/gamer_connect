import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/Vender_Verification_Screens/verification_step2.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class VerificationStep1 extends StatefulWidget {
  const VerificationStep1({super.key});

  @override
  State<VerificationStep1> createState() => _VerificationStep1State();
}

class _VerificationStep1State extends State<VerificationStep1> {
  final sNCtrl = TextEditingController();
  final sCCtrl = TextEditingController();
  final sAddrCtrl = TextEditingController();
  File? cnicFront;
  File? cnicBack;
  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.btnColor,
          title: Text("Seller Registration", style: TextUtils.heading2),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: fKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: media.height * 0.02),
                  const Text(
                    'Basic Information',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: media.height * 0.02),
                  TextFormField(
                    // obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Shop Name is required';
                      }

                      return null;
                    },

                    style: TextStyle(color: AppColor.black),
                    controller: sNCtrl,
                    cursorColor: AppColor.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      labelText: 'Shop Name',

                      labelStyle: TextUtils.body16,
                      // suffixIcon: Icon(Icons.name, color: AppColor.black),
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
                  ),
                  SizedBox(height: media.height * 0.02),
                  TextFormField(
                    // obscureText: true,
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

                    style: TextStyle(color: AppColor.black),
                    controller: sCCtrl,
                    cursorColor: AppColor.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      labelText: 'Shop Contact',

                      labelStyle: TextUtils.body16,
                      // suffixIcon: Icon(Icons.name, color: AppColor.black),
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
                  ),
                  SizedBox(height: media.height * 0.02),
                  TextFormField(
                    style: TextStyle(color: AppColor.black),
                    controller: sAddrCtrl,
                    cursorColor: AppColor.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      labelText: 'Shop Address (Optional)',

                      labelStyle: TextUtils.body16,
                      // suffixIcon: Icon(Icons.name, color: AppColor.black),
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
                  ),
                  SizedBox(height: media.height * 0.02),

                  SizedBox(height: media.height * 0.02),
                  GestureDetector(
                    onTap: () async {
                      ImagePicker picker = ImagePicker();
                      XFile? file1 = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (file1 != null) {
                        cnicFront = File(file1.path);
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: cnicFront == null
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.image),
                                  Text("CNIC Front"),
                                ],
                              ),
                            )
                          : Image.file(cnicFront!),
                    ),
                  ),
                  SizedBox(height: media.height * 0.02),
                  GestureDetector(
                    onTap: () async {
                      ImagePicker picker = ImagePicker();
                      XFile? file1 = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (file1 != null) {
                        cnicBack = File(file1.path);
                        setState(() {});
                      }
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: cnicBack == null
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.image),
                                  Text("CNIC Back"),
                                ],
                              ),
                            )
                          : Image.file(cnicBack!),
                    ),
                  ),
                  SizedBox(height: media.height * 0.04),
                  Reusebtn(
                    title: 'Submit',
                    ontap: () {
                      if (fKey.currentState!.validate()) {
                        if (cnicFront == null || cnicBack == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please upload CNIC pictures"),
                            ),
                          );
                        } else {
                          Provider.of<AuthPro>(
                            context,
                            listen: false,
                          ).sellerSignUp(
                            address: sAddrCtrl.text,
                            contact: sCCtrl.text,
                            name: sNCtrl.text,
                            cnicFront: cnicFront!,
                            cnicBack: cnicBack!,
                            context: context,
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
