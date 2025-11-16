import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/profileText.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? image;
  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final meida = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
        body: Consumer<AuthPro>(
          builder: (context, provider, child) => provider.isLoadingProf
              ? Center(child: CircularProgressIndicator())
              : provider.userData == null
              ? Center(child: Text("No Profile Details to show."))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Form(
                      key: fKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment
                                .center, // Align children in the center
                            children: [
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    top: 30,
                                  ), // Adjust top margin
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: image != null
                                          ? FileImage(image!)
                                          : NetworkImage(
                                              provider.userData!.profile == ""
                                                  ? 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'
                                                  : provider.userData!.profile,
                                            ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 25,
                                right: 90, // Adjust edit button position
                                child: GestureDetector(
                                  onTap: () async {
                                    ImagePicker picker = ImagePicker();
                                    XFile? file1 = await picker.pickImage(
                                      source: ImageSource.gallery,
                                    );
                                    if (file1 != null) {
                                      image = File(file1.path);
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: AppColor.btnColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // SizedBox(height: 60),
                          SizedBox(height: meida.height * 0.02),
                          Text(
                            'Personal Information',
                            style: TextUtils.heading4,
                          ),
                          SizedBox(height: meida.height * 0.02),
                          ProfileText(
                            controller: provider.nameController,
                            labelText: 'Name',
                            readOnly: false,
                            validator: (val) {
                              if (val!.trim().isEmpty) {
                                return "";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: meida.height * 0.001),
                          ProfileText(
                            controller: provider.emailController,
                            labelText: 'Email',
                            readOnly: true,
                          ),
                          SizedBox(height: meida.height * 0.001),
                          ProfileText(
                            controller: provider.phoneController,
                            labelText: 'Phone',
                            readOnly: false,
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
                          ),
                          // SizedBox(height: meida.height * 0.001),
                          // ProfileText(
                          //   controller: statucController,
                          //   labelText: 'Status',
                          //   readOnly: false,
                          // ),
                          SizedBox(height: meida.height * 0.04),
                          Reusebtn(
                            title: 'SAVE',
                            ontap: () {
                              if (fKey.currentState!.validate()) {
                                provider.editProfDets(
                                  context: context,
                                  image: image,
                                );
                              }
                            },
                          ),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text('Back')),
                          SizedBox(height: meida.height * 0.07),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
