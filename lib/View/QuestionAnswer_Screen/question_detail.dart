import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/QuestionAnswer_Screen/ask_question.dart';
import 'package:page_transition/page_transition.dart';

class QuestionDetail extends StatefulWidget {
  const QuestionDetail({super.key});

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.btnColor,
        title: Text(
          'Question Detail',
          style: TextUtils.heading3,
        ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, PageTransition(child: AskQuestion(), type: PageTransitionType.rightToLeft));
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColor.btnColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "Ask Question",
                          style:TextStyle(color:Colors.white , fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: media.height * 0.01,
              ),
              Text(
                'PUBG GAME PROBLEM DURING OPENT THE GANE',
                style: TextUtils.body18,
              ),
              SizedBox(
                height: media.height * 0.01,
              ),
              Text(
                'What is the maximum number of players allowed in a single PUBG match',
                style: TextUtils.body14,
              ),
              SizedBox(
                height: media.height * 0.01,
              ),
              Image.asset("assets/ts.png"),
              SizedBox(
                height: media.height * 0.01,
              ),
              Text(
                'Answers',
                style: TextUtils.body18,
              ),
              SizedBox(
                height: media.height * 0.28,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.white)),
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Text('1'),
                          ),
                          title: Text(
                            'User Name',
                            style: TextUtils.heading4,
                          ),
                          subtitle: Text(
                            "If you're on PC, use the game platform (Steam or others) to verify the integrity of game files",
                            style: TextUtils.body14,
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: media.height * 0.01,
              ),
              Text(
                'Your Answers',
                style: TextUtils.body18,
              ),
              SizedBox(
                height: media.height * 0.01,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Your Answer",
                  hintStyle: TextUtils.body18,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  )
                ),
                minLines:
                    6, // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(height: media.height * 0.01,),
              Reusebtn(title: "Post Your Answer", ontap: (){}),
              
              SizedBox(height: media.height * 0.03,),
            ],
          ),
        ),
      ),
    );
  }
}
