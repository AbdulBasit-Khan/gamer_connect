import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamerconnect/helper/helper.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuesAnsPro with ChangeNotifier {
  insertQuestion({
    required BuildContext context,
    required String title,
    required String body,
  }) async {
    try {
      Helper.showLoader(context);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String uid = prefs.getString("uId") ?? "";
      int time = DateTime.now().millisecondsSinceEpoch;
      await FirebaseFirestore.instance
          .collection('questions')
          .doc(time.toString())
          .set({
            "createdAt": FieldValue.serverTimestamp(),
            "id": time,
            "title": title,
            "body": body,
            "userId": uid,
            "profile":
                Provider.of<AuthPro>(context, listen: false).userData != null &&
                    Provider.of<AuthPro>(
                          context,
                          listen: false,
                        ).userData!.profile ==
                        ""
                ? 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'
                : Provider.of<AuthPro>(
                    context,
                    listen: false,
                  ).userData!.profile,
          });
      Navigator.pop(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Question Posted Successfully.")));
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error Occured")));
    }
  }
}
