import 'package:flutter/material.dart';
import 'package:gamerconnect/Models/news_model.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:intl/intl.dart';

class NewdetailScreen extends StatefulWidget {
  final NewsModel model;
  const NewdetailScreen({super.key,required this.model});

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
                  widget.model.title,
                  style: TextUtils.titleText,
                ),
                SizedBox(
                  height: media.height * 0.02,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Image.network(
                    widget.model.imageUrl,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                // SizedBox(
                //   height: media.height * 0.02,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       '2 hour ago',
                //       style: TextUtils.body14,
                //     ),
                //     Text('By Caroline Casey', style: TextUtils.body14),
                //   ],
                // ),
                SizedBox(
                  height: media.height * 0.03,
                ),
                Text(
                  widget.model.description,
                  textAlign: TextAlign.start,
                  style: TextUtils.body16,
                ),
                SizedBox(
                  height: media.height * 0.03,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                      'Published',
                      style: TextStyle(fontSize: 15,fontWeight:FontWeight.w500),
                    ),
                        Text(
                          DateFormat('MMMM d, yyyy').format(widget.model.createdAt.toDate()),
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: media.height * 0.03,
                ),
              
],
            ),
          ),
        ),
      ),
    );
  }
}
