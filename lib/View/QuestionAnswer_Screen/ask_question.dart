import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class AskQuestion extends StatefulWidget {
  const AskQuestion({super.key});

  @override
  State<AskQuestion> createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  final title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: AppColor.btnColor,
        title: Text(
          'Ask Question ',
          style: GoogleFonts.roboto(
    textStyle:TextStyle(fontSize: 20 , fontWeight: FontWeight.w800 , color: AppColor.whiteColor),
        ),),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
              Text('Ask a Question ', style: TextUtils.titleText,),
                SizedBox(height: 20,),
                Text('Title' , style: TextUtils.body18,),
                SizedBox(height:10,),
                Text('Be review and imaging that you are asking a question to another persons' , style: TextUtils.body14,),
                SizedBox(height: 12,),
                ReuseTextForm(controller: title, hinttext: "title", icondata: Icons.edit , ),
                SizedBox(height: 12,),
                Text('Body' , style: TextUtils.body18,),
                SizedBox(height:10,),
                Text('The body of your Question contain your problem detail and result' , style: TextUtils.body14,),
               SizedBox(height:10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Your Answer",
                    hintStyle: TextUtils.body18,
                    border:const OutlineInputBorder(),
                    focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    )
                  ),
                  minLines:
                      6, // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                SizedBox(height:10,),
                Reusebtn(title: "Post Your Answer", ontap: (){}),
                SizedBox(height:10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}