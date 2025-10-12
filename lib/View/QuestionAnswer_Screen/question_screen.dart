import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/QuestionContainer.dart';
import 'package:gamerconnect/Components/searchbartext.dart';
import 'package:gamerconnect/Models/news_model.dart';
import 'package:gamerconnect/Models/question_model.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/QuestionAnswer_Screen/ask_question.dart';
import 'package:gamerconnect/View/QuestionAnswer_Screen/question_detail.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final SearchController = TextEditingController();
  final CollectionReference quesRef = FirebaseFirestore.instance.collection(
    'questions',
  );
  var ref = null;
  @override
  void initState() {
    ref = quesRef.orderBy('createdAt', descending: true).snapshots();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => AskQuestion()));
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: media.height * 0.015),
              SearchBarText(
                controller: SearchController,
                hintText: 'Search Question',
                onChanged: (val) {},
              ),
              SizedBox(height: media.height * 0.01),
              Text('1020 Questions', style: TextUtils.heading4),
              SizedBox(height: media.height * 0.01),

              // Expanded(
              //   child: StreamBuilder<QuerySnapshot>(
              //     stream: ref,
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Center(child: CircularProgressIndicator());
              //       }

              //       if (snapshot.hasError) {
              //         return Center(child: Text('Error occurred'));
              //       }

              //       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              //         return Center(child: Text('No questions to show'));
              //       }

              //       final docs = snapshot.data!.docs;

              //       return ListView.builder(
              //         itemCount: docs.length,
              //         itemBuilder: (context, index) {
              //           final data = docs[index].data() as Map<String, dynamic>;
              //           log(data.toString());
              //           QuestionModel model = QuestionModel.fromMap(data);

              //           return model.title.toLowerCase().contains(
              //                 SearchController.text.toLowerCase(),
              //               )
              //               ? GestureDetector(
              //                   onTap: () {},
              //                   child: Container(
              //                     margin: const EdgeInsets.symmetric(
              //                       vertical: 4,
              //                     ),
              //                     padding: const EdgeInsets.only(
              //                       left: 10,
              //                       top: 4,
              //                       bottom: 4,
              //                     ),
              //                     width: double.infinity,
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(3),
              //                       border: Border.all(
              //                         color: AppColor.greyColor,
              //                       ),
              //                     ),
              //                     child: Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Row(
              //                           children: [
              //                             const Padding(
              //                               padding: EdgeInsets.only(top: 8),
              //                               child: CircleAvatar(
              //                                 backgroundImage: AssetImage(
              //                                   'assets/deadbydaylight.jpg',
              //                                 ),
              //                               ),
              //                             ),
              //                             SizedBox(width: media.width * 0.05),
              //                             Text(
              //                               'Waseem Akram Janyaro',
              //                               style: TextUtils.heading3,
              //                             ),
              //                           ],
              //                         ),
              //                         SizedBox(height: media.height * 0.01),
              //                         Text(
              //                           'PUBG GAME PROBLEM DURING OPEN THE GAME',
              //                           style: TextUtils.titleText,
              //                           maxLines: 2,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                         SizedBox(height: media.height * 0.001),
              //                         Text(
              //                           'What is the maximum number of players allowed in a single PUBG match?',
              //                           style: TextUtils.body16,
              //                         ),
              //                         SizedBox(height: media.height * 0.006),
              //                         Row(
              //                           children: [
              //                             InkWell(
              //                               onTap: () {},
              //                               child: Container(
              //                                 width: media.width * 0.24,
              //                                 height: media.height * 0.042,
              //                                 decoration: BoxDecoration(
              //                                   color: AppColor.btnColor,
              //                                   borderRadius:
              //                                       BorderRadius.circular(50),
              //                                 ),
              //                                 child: Center(
              //                                   child: Text(
              //                                     '12 Answers',
              //                                     style: GoogleFonts.roboto(
              //                                       textStyle: TextStyle(
              //                                         fontSize: 14,
              //                                         fontWeight:
              //                                             FontWeight.normal,
              //                                         color:
              //                                             AppColor.whiteColor,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                             SizedBox(width: media.width * 0.02),
              //                             InkWell(
              //                               onTap: () {},
              //                               child: Container(
              //                                 width: media.width * 0.24,
              //                                 height: media.height * 0.042,
              //                                 decoration: BoxDecoration(
              //                                   color: AppColor.btnColor,
              //                                   borderRadius:
              //                                       BorderRadius.circular(50),
              //                                 ),
              //                                 child: Center(
              //                                   child: Text(
              //                                     '6 View',
              //                                     style: GoogleFonts.roboto(
              //                                       textStyle: TextStyle(
              //                                         fontSize: 14,
              //                                         fontWeight:
              //                                             FontWeight.normal,
              //                                         color:
              //                                             AppColor.whiteColor,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 )
              //               : SizedBox();
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
