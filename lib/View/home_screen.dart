import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/searchbartext.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/newsdetail_screen.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               SizedBox(height: media.height * 0.01,),
               SearchBarText(controller: SearchController, hintText: 'Search Game',),
               SizedBox(height: media.height * 0.01,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
            Text('Trending News' , style: TextUtils.heading3,),
            Text('See all' , style: TextUtils.linktext,)
                    ],
                  ),
                  SizedBox(height: media.height * 0.01,),
                 SizedBox(
  height: media.height , // Set an appropriate height
  child: ListView.builder(
    itemCount: 6,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: (){
          Navigator.push(context , PageTransition(child:
          NewdetailScreen(
          ), type: PageTransitionType.leftToRight));

        },
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/gtavice.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
               const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Global Summit on Climate Change: Historic Agreement Reached',
                      overflow: TextOverflow.ellipsis,
                      style: TextUtils.body18,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    SizedBox(height: media.height * 0.01),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('June 9, 2023', style: TextUtils.body14),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  ),
)

                 ],
            ),
          ),
        )
      ;
  }
}