import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamerconnect/Models/user_model.dart';
import 'package:gamerconnect/View/home_screen.dart';
import 'package:gamerconnect/helper/helper.dart';
import 'package:gamerconnect/root_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPro with ChangeNotifier {
  bool isLoadingProf = true;
  UserModel? userData;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

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

  Future<void> resetPassword({
    required BuildContext context,
    required String email,
  }) async {
    try {
      Helper.showLoader(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.pop(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset email sent! Check your inbox."),
          backgroundColor: Colors.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      String message = '';
      if (e.code == 'user-not-found') {
        message = "No user found with this email.";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email address.";
      } else {
        message = e.message ?? "Something went wrong.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  editProfDets({required BuildContext context, File? image}) async {
    try {
      Helper.showLoader(context);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String uid = prefs.getString('uId') ?? "";

      if (image != null) {
        final fileName = DateTime.now().millisecondsSinceEpoch.toString();
        final storageRef = FirebaseStorage.instance.ref().child(
          'uploads/$fileName.jpg',
        );
        await storageRef.putFile(image);
        final downloadURL = await storageRef.getDownloadURL();
        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          "name": nameController.text,
          "phone": phoneController.text,
          "profile": downloadURL,
        });
      } else {
        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          "name": nameController.text,
          "phone": phoneController.text,
        });
      }
      getProfile();
      Navigator.pop(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Profile Updated Successfully"),
          // backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error Occured"), backgroundColor: Colors.red),
      );
    }
  }

  getProfile() async {
    try {
      isLoadingProf = true;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String uid = prefs.getString('uId') ?? "";
      var data = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      userData = UserModel.fromMap(data.data() ?? {});
      nameController.text = userData!.name;
      phoneController.text = userData!.phone;
      emailController.text = userData!.email;
      log(data.data().toString());
      isLoadingProf = false;
      notifyListeners();
    } catch (e) {
      log("error occured");
      isLoadingProf = false;
      notifyListeners();
    }
  }

  signIn({
    required String email,
    required String pass,
    required BuildContext context,
  }) async {
    try {
      Helper.showLoader(context);

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      User? user = userCredential.user;

      if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("uId", user.uid);

        Navigator.of(context).pop();

        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            child: const RootScreen(),
            type: PageTransitionType.bottomToTop,
          ),
          (Route<dynamic> route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Invalid email or password")),
      );
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Unexpected error occurred")),
      );
    }
  }
}
