
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/View/Auth/login_screen.dart';
import 'package:gamerconnect/root_screen.dart';

class AuthService {
 
 final auth = FirebaseAuth.instance;
 final firestore = FirebaseFirestore.instance;
// check the user is already login or not

Future<void> checkUser (BuildContext context) async{
  final user = await auth.currentUser;
  if(user != null){
    Navigator.push(context, MaterialPageRoute(builder: (context) => RootScreen()));
  }
  else{
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }
}

// to Register the user into the Firebase
 Future<User?> registerUser (BuildContext context , String name,String email , String pnumber,String password , confirmpassword) async{
  try {
   
  if(pnumber != confirmpassword){
    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(content: Text('Please user the same password')));
  }else{
    final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    if(user != null){
      await firestore.collection('user').doc(user.uid).set({
        'name':name,
        'email':email,
        'phone_number':pnumber
      });
    }
    return user;
  } 
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration error $e')));
  }
 }
 
 // for Login the user into the system
Future<User?> LoginUser (BuildContext context ,String email , String password) async{
  try {
  final result = await auth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login error $e')));
  }
}

// forget the user 
Future<void> forgetPassword (String email) async{
  await auth.sendPasswordResetEmail(email: email);
}

// logout the user 
Future<void> logout()async{
  await auth.signOut();
}
// fetch the user information to disply it into the profile screen
Future<Map<String ,dynamic>?> getUserInfo () async{
  final user = await auth.currentUser;
  if(user == null){
    print('user is not login');
    return null;
  }
  final snapshot = await firestore.collection('user').doc(user.uid).get();
  if(snapshot.exists){
    return snapshot.data();
  }
  else{
    return null;
  }
}

}