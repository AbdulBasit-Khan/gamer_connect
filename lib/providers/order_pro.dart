import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/Models/product_model.dart';
import 'package:gamerconnect/helper/helper.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:provider/provider.dart';

class OrderPro with ChangeNotifier {
  placeOrder({
    required String name,
    required String address,
    required String phone,
    required int count,
    required BuildContext context,
    required ProductModel model,
  }) async {
    try {
      Helper.showLoader(context);
      final id = DateTime.now().millisecondsSinceEpoch;
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(id.toString())
          .set({
            "id": id.toString(),
            "name": name,
            "address": address,
            "phone": phone,
            "quantity": count,
            "productId": model.id,
            "productImage": model.images[0],
            "productName": model.name,
            "productPrice": model.price,
            "sellerId": model.sellerId,
            "userId": Provider.of<AuthPro>(
              context,
              listen: false,
            ).userData!.uid,
          });
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Order placed successfully")));
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Something went wrong")));
    }
  }
}
