import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/searchbartext.dart';
import 'package:gamerconnect/Models/news_model.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/New_Screens/new_screen.dart';
import 'package:gamerconnect/View/newsdetail_screen.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SearchController = TextEditingController();
      final CollectionReference newsRef =
      FirebaseFirestore.instance.collection('news');
  var ref=null;
  @override
  void initState() {
    super.initState();
    ref=newsRef.orderBy('createdAt', descending: true).snapshots();
  }
 @override
Widget build(BuildContext context) {
  final media = MediaQuery.of(context).size;

  return GestureDetector(
    onTap: () {
      FocusScope.of(context).unfocus(); // dismisses the keyboard
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: media.height * 0.01),
          SearchBarText(
            controller: SearchController,
            hintText: 'Search Game',
            onChanged: (val) {
              setState(() {});
            },
          ),
          SizedBox(height: media.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('News Updates', style: TextUtils.heading3),
            ],
          ),
          SizedBox(height: media.height * 0.01),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: ref,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error occurred'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No news to show'));
                }

                final docs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    NewsModel model = NewsModel.fromJson(data);

                    return model.title.toLowerCase().contains(
                            SearchController.text.toLowerCase())
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewdetailScreen(
                                            model: model,
                                          )));
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    model.imageUrl,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model.title,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextUtils.body18,
                                          maxLines: 2,
                                        ),
                                        SizedBox(
                                            height: media.height * 0.01),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Text(
                                            DateFormat('MMMM d, yyyy').format(
                                                model.createdAt.toDate()),
                                            style: TextUtils.body14,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : SizedBox();
                  },
                );
              },
            ),
          )
        ],
      ),
    ),
  );
}
}