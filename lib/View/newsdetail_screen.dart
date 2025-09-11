import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';

class NewdetailScreen extends StatefulWidget {
  const NewdetailScreen({super.key});

  @override
  State<NewdetailScreen> createState() => _NewdetailScreenState();
}

class _NewdetailScreenState extends State<NewdetailScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Detail", style: TextUtils.heading2),
          centerTitle: true,
          backgroundColor: AppColor.btnColor,
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: media.height * 0.03,
                ),
                Text(
                  textAlign: TextAlign.start,
                  'Global Summit on Climate Change Historic Agreement Reached',
                  style: TextUtils.titleText,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Image.asset(
                    'assets/ts.png',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2 hour ago',
                      style: TextUtils.body14,
                    ),
                    Text('By Caroline Casey', style: TextUtils.body14),
                  ],
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Text(
                  '''Crowds watched solemnly as the body of Rep. John Lewis crossed the Edmund Pettus Bridge one final time, 55 years after the civil rights icon marched for peace and was met with brutality in Selma, Alabama.Body bearers from the U.S. armed forces placed the late Georgia congressman and civil rights icon onto a horse-drawn caisson Sunday at the Brown Chapel African Methodist Episcopal Church. From there, the public were allowed to line up to honor Lewis for about a half-mile to the foot of the bridge .Rep. Terri Sewell, D-Al., thanked Lewis’ family during a ceremony at the chapel for sharing the congressman with the public for so many years.''',
                  textAlign: TextAlign.start,
                  style: TextUtils.body16,
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
                Text(
                  'Recommended News ',
                  style: TextUtils.titleText,
                ),
                SizedBox(
                  height: media.height * 0.01,
                ),
              
],
            ),
          ),
        ),
      ),
    );
  }
}
