import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamerconnect/View/home_screen.dart';
import 'package:gamerconnect/helper/helper.dart';
import 'package:gamerconnect/root_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPro with ChangeNotifier {
  signUp({
    required String name,
    required String email,
    required String pass,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      Helper.showLoader(context);

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);

      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': name,
          'email': email,
          'phone': phone,
          'createdAt': FieldValue.serverTimestamp(),
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("uId", user!.uid);
      }

      Navigator.of(context).pop();
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          child: const RootScreen(),
          type: PageTransitionType.bottomToTop,
        ),
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Something went wrong")),
      );
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Unexpected error occurred")),
      );
    }
  }
}
