import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class QuestionContainer extends StatelessWidget {
  final VoidCallback ontap;
  const QuestionContainer({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        margin:const EdgeInsets.symmetric(vertical: 4),
                  padding:const EdgeInsets.only(left: 10 , top: 4 , bottom: 4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: AppColor.greyColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/deadbydaylight.jpg'),
                            ),
                          ),
                          SizedBox(width: media.width * 0.05),
                          Text('Waseem Akram Janyaro', style: TextUtils.heading3),
                        ],
                      ),
                      SizedBox(height: media.height * 0.01),
                      Text(
                        'PUBG GAME PROBLEM DURING OPEN THE GAME',
                        style: TextUtils.titleText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: media.height * 0.001),
                      Text('What is the maximum number of players allowed in a single PUBG match?' , style:  TextUtils.body16,),
                     SizedBox(height: media.height * 0.006),
                      // Wrap ReadMoreText inside GestureDetector
                      // ReadMoreText(
                      //   'What is the maximum number of players allowed in a single PUBG match? '
                      //   'This game is played with a hundred players on a single large map, and each match can be intense!',
                      //   numLines: 2,
                      //   readMoreText: 'More',
                      //   readLessText: 'Less',
                      //   style: TextUtils.body16,
                      // ),
                      // SizedBox(height: media.height * 0.0001,),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: media.width * 0.24,
                              height: media.height * 0.042,
                              decoration: BoxDecoration(
                              color: AppColor.btnColor,
                              borderRadius: BorderRadius.circular(50)
                              ),
                              child: Center(child: Text('12 Answers' , style: TextUtils.body14,),),
                            ),
                          ),
                          SizedBox(width: media.width * 0.02,),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              width: media.width * 0.24,
                              height: media.height * 0.042,
                              decoration: BoxDecoration(
                              color: AppColor.btnColor,
                              borderRadius: BorderRadius.circular(50)
                              ),
                              child: Center(child: Text('6 View' , style: TextUtils.body14,),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
    )
            ;
  }
}