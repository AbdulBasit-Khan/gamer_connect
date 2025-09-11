import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/View/Vender_Verification_Screens/vender_dashboard.dart';

class VerificationStep2 extends StatefulWidget {
  const VerificationStep2({super.key});

  @override
  State<VerificationStep2> createState() => _VerificationStep2State();
}

class _VerificationStep2State extends State<VerificationStep2> {
  final cnicController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         const Text('CNIC Information',style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold)),
          SizedBox(height: media.height * 0.02,),
          ReuseTextForm(controller: cnicController, hinttext: 'CNIC Number', icondata: Icons.document_scanner),
          SizedBox(height: media.height * 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text('Upload CNIC Front Pic',style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold)) ,
               IconButton(onPressed: (){}, icon:const Icon(Icons.document_scanner , color: Colors.black, size: 30,),),
               ],
          ),
          SizedBox(height: media.height * 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  Text('Upload CNIC Back Pic',style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold)) ,
               IconButton(onPressed: (){}, icon:const Icon(Icons.document_scanner , color: Colors.black, size: 30,),),
            ],
          ),
          SizedBox(height: media.height * 0.04,),
          Reusebtn(title: 'Submit', ontap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> VenderDashboard()));
          }),
          Center(
            child: TextButton(onPressed: (){
              Navigator.pop(context);
            }, child:const Text('Back' , style: TextStyle(fontSize: 18 , color: Colors.black),)),
          )
          ],
        ),
      ),
    );
  }
}