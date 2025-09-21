import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/QuestionContainer.dart';
import 'package:gamerconnect/Components/searchbartext.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/QuestionAnswer_Screen/question_detail.dart';
import 'package:page_transition/page_transition.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final SearchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: media.height * 0.015),
              SearchBarText(controller: SearchController, hintText: 'Search Question',onChanged: (val){},),
              SizedBox(height: media.height * 0.01),
              Text('1020 Questions', style: TextUtils.heading4),
              SizedBox(height: media.height * 0.01),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context , index){
                  return QuestionContainer(ontap: (){
                  Navigator.push(context, PageTransition(child:const QuestionDetail(), type: PageTransitionType.leftToRight));
                  },);
                }),
              )
              ],
          ),
        ),
      ),
    );
  }
}
