import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Models/answer_model.dart';
import 'package:gamerconnect/Models/question_model.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/QuestionAnswer_Screen/ask_question.dart';
import 'package:gamerconnect/providers/ques_ans_pro.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class QuestionDetail extends StatefulWidget {
  final QuestionModel question;
  const QuestionDetail({super.key, required this.question});

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  final ansCtrl = TextEditingController();
  final fKey = GlobalKey<FormState>();
  final CollectionReference ansRef = FirebaseFirestore.instance.collection(
    'answers',
  );
  var ref = null;
  // @override
  // void initState() {
  //   ref = ansRef
  //       .orderBy('createdAt', descending: true)
  //       .where('questionId', isEqualTo: widget.question.id)
  //       .snapshots();

  //   super.initState();
  // }

  final SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.btnColor,
        title: Text('Question Detail', style: TextUtils.heading3),
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
        child: Form(
          key: fKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: media.height * 0.03),
                      Text(widget.question.title, style: TextUtils.body18),
                      SizedBox(height: media.height * 0.01),
                      Text(widget.question.body, style: TextUtils.body14),
                      // SizedBox(height: media.height * 0.01),
                      // Image.asset("assets/ts.png"),
                      SizedBox(height: media.height * 0.01),
                      Text('Answers', style: TextUtils.body18),
                      StreamBuilder<QuerySnapshot>(
                        stream: ansRef
                            .orderBy('createdAt', descending: true)
                            .where('questionId', isEqualTo: widget.question.id)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (snapshot.hasError) {
                            return Center(child: Text('Error occurred'));
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Center(child: Text('No answers to show'));
                          }

                          final docs = snapshot.data!.docs;

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            primary: false,
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              final data =
                                  docs[index].data() as Map<String, dynamic>;
                              // log(data.toString());
                              AnswerModel model = AnswerModel.fromMap(data);

                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      model.profile,
                                    ),
                                  ),
                                  title: Text(model.name, style: TextStyle()),
                                  subtitle: Text(
                                    model.answer,
                                    style: TextUtils.body14,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: media.height * 0.01),
              Text('Your Answers', style: TextUtils.body18),
              SizedBox(height: media.height * 0.01),
              TextFormField(
                controller: ansCtrl,
                validator: (val) {
                  if (val!.trim().isEmpty) {
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Your Answer",
                  hintStyle: TextUtils.body18,

                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                minLines:
                    6, // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(height: media.height * 0.01),
              Reusebtn(
                title: "Post Your Answer",
                ontap: () async {
                  if (fKey.currentState!.validate()) {
                    Provider.of<QuesAnsPro>(
                      context,
                      listen: false,
                    ).insertAnswer(
                      context: context,
                      answer: ansCtrl.text,
                      questionId: widget.question.id,
                    );
                    ansCtrl.text = "";
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
              ),

              SizedBox(height: media.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
