import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/Models/product_model.dart';

class ProductsPro with ChangeNotifier {
  bool isLoadingProducts = true;
  List<ProductModel> products = [];
  getProducts({required BuildContext context}) async {
    try {
      isLoadingProducts = true;
      notifyListeners();
      products = [];
      var data = await FirebaseFirestore.instance.collection('products').get();
      for (int i = 0; i < data.docs.length; i++) {
        log(data.docs[i].data().toString());
        products.add(ProductModel.fromMap(data.docs[i].data()));
      }
      isLoadingProducts = false;
      notifyListeners();
    } catch (e) {
      isLoadingProducts = false;
      notifyListeners();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Something went wrong")));
    }
  }
}
