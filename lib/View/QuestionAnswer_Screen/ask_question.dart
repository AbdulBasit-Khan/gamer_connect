import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Components/reuse_textform.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/providers/ques_ans_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AskQuestion extends StatefulWidget {
  const AskQuestion({super.key});

  @override
  State<AskQuestion> createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  final titleCtrl = TextEditingController();
  final bodyCtrl = TextEditingController();
  final fKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.btnColor,
          title: Text(
            'Ask Question ',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColor.whiteColor,
              ),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Form(
              key: fKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text('Ask a Question ', style: TextUtils.titleText),
                  SizedBox(height: 20),
                  Text('Title', style: TextUtils.body18),
                  SizedBox(height: 10),
                  Text(
                    'Be review and imaging that you are asking a question to another persons',
                    style: TextUtils.body14,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    style: TextStyle(color: AppColor.black),
                    controller: titleCtrl,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '';
                      }

                      return null;
                    },
                    cursorColor: AppColor.black,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      labelText: 'Title',
                      labelStyle: TextUtils.body16,
                      // suffixIcon: Icon(
                      //   Icons.alternate_email,
                      //   color: AppColor.black,
                      // ),
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
                  SizedBox(height: 12),
                  Text('Body', style: TextUtils.body18),
                  SizedBox(height: 10),
                  Text(
                    'The body of your Question contain your problem detail and result',
                    style: TextUtils.body14,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    style: TextStyle(color: AppColor.black),
                    controller: bodyCtrl,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '';
                      }

                      return null;
                    },
                    
                    cursorColor: AppColor.black,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    decoration: InputDecoration(
                    alignLabelWithHint: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      labelText: 'Body',
                      labelStyle: TextUtils.body16,
                      // suffixIcon: Icon(
                      //   Icons.alternate_email,
                      //   color: AppColor.black,
                      // ),
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
                  SizedBox(height: 10),
                  Reusebtn(
                    title: "Post Your Question",
                    ontap: () {
                      if (fKey.currentState!.validate()) {
                        Provider.of<QuesAnsPro>(
                          context,
                          listen: false,
                        ).insertQuestion(
                          context: context,
                          title: titleCtrl.text,
                          body: bodyCtrl.text,
                        );
                      }
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
