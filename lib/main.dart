import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/View/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:gamerconnect/providers/ques_ans_pro.dart';
import 'package:gamerconnect/root_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? uId;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  uId = prefs.getString("uId");
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthPro()),
        ChangeNotifierProvider(create: (_) => QuesAnsPro()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColor.themeColor),
      home: uId != null ? RootScreen() : LoginScreen(),
    );
  }
}
