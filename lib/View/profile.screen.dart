import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/profileText.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final meida = MediaQuery.of(context).size;
    final nameController = TextEditingController(text: 'Waseem Akram Janyaro');
    final emailController = TextEditingController(text: 'waseemjanyaro@gmail.com');
    final phoneController = TextEditingController(text: '+92-3132773873');
    final statucController = TextEditingController(text: 'Seller');
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center, // Align children in the center
                  children: [
                    Center(
                      child: Container(
                        margin:const EdgeInsets.only(top: 30), // Adjust top margin
                        width: 200,
                        height: 200,
                        decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/deadbydaylight.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      right: 90, // Adjust edit button position
                      child: Container(
                        padding:const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColor.btnColor,
                          shape: BoxShape.circle,
                        ),
                        child:const Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ],
                ),
            
                SizedBox(height: meida.height * 0.02), 
                  Text('Personal Information' , style: TextUtils.heading4,),
                SizedBox(height: meida.height * 0.02),
                ProfileText(controller: nameController, labelText: 'Name' , readOnly: false,),
                SizedBox(height: meida.height * 0.001,),
                ProfileText(controller: emailController, labelText: 'Email' , readOnly: false,),
                SizedBox(height: meida.height * 0.001,),
                ProfileText(controller: phoneController, labelText: 'Phone' , readOnly: false,),
                SizedBox(height: meida.height * 0.001,),
                ProfileText(controller: statucController, labelText: 'Status' , readOnly: false,),SizedBox(height: meida.height * 0.04,),
                Reusebtn(title: 'SAVE', ontap: (){}),
                SizedBox(height: meida.height * 0.07,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
