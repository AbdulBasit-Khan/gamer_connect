import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/helper/helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellerProductPro with ChangeNotifier {
  Future<List<String>> uploadFilesToFirebase(List<XFile> files) async {
    final storage = FirebaseStorage.instance;
    List<String> downloadUrls = [];

    try {
      for (var file in files) {
        final fileName = DateTime.now().millisecondsSinceEpoch.toString();
        final ref = storage.ref().child('uploads/$fileName');

        // Upload file
        final uploadTask = ref.putFile(File(file.path));
        final snapshot = await uploadTask.whenComplete(() {});

        // Get download URL
        final downloadUrl = await snapshot.ref.getDownloadURL();
        downloadUrls.add(downloadUrl);
      }

      return downloadUrls;
    } catch (e) {
      rethrow;
    }
  }

  addProduct({
    required BuildContext context,
    required String name,
    required int price,
    required String description,
    required String categ,
    required List<XFile> images1,
  }) async {
    try {
      Helper.showLoader(context);
      List images = await uploadFilesToFirebase(images1);
      int docId = DateTime.now().millisecondsSinceEpoch;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String uid = prefs.getString('uId') ?? "";
      await FirebaseFirestore.instance
          .collection('products')
          .doc(docId.toString())
          .set({
            "name": name,
            "price": price,
            "description": description,
            "category": categ,
            "images": images,
            "sellerId": uid,
            "id": docId,
            "createdAt": Timestamp.now(),
          });
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Item Uploaded Successfully")),
      );
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Unexpected error occurred")),
      );
    }
  }
}
