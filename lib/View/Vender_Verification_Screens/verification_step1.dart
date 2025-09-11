import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/View/Vender_Verification_Screens/verification_step2.dart';

class VerificationStep1 extends StatefulWidget {
  const VerificationStep1({super.key});

  @override
  State<VerificationStep1> createState() => _VerificationStep1State();
}

class _VerificationStep1State extends State<VerificationStep1> {
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(height: media.height * 0.02,),
             const Text('Basic Information', style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),),
             SizedBox(height: media.height * 0.02,),
              ReuseTextForm(controller: addressController, hinttext: 'Address', icondata: Icons.location_city),
              SizedBox(height: media.height * 0.02,),
              ReuseTextForm(controller: phoneNumberController, hinttext: 'Phone Number', icondata: Icons.phone),
              SizedBox(height: media.height * 0.02,),
              ReuseTextForm(controller: emailController, hinttext: 'Email Address', icondata: Icons.alternate_email),
              SizedBox(height: media.height * 0.04,),
              Reusebtn(title: 'Next', ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const VerificationStep2()));
              }),
                        Center(
            child: TextButton(onPressed: (){
              Navigator.pop(context);
            }, child:const Text('Back' , style: TextStyle(fontSize: 18 , color: Colors.black),)),
          )

            ],
          ),
        ),
      ),
    );
  }
}