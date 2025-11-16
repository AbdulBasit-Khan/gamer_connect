import 'package:flutter/material.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gamerconnect/View/Market_module/Listing%20Screens/market_module_screen.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:gamerconnect/providers/news_pro.dart';
import 'package:gamerconnect/providers/products_pro.dart';
import 'package:gamerconnect/providers/ques_ans_pro.dart';
import 'package:gamerconnect/providers/seller_product_pro.dart';
import 'package:gamerconnect/root_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

String? uId;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.urlScheme = 'flutterstripe';
  // Stripe.publishable
  // await Stripe.instance.applySettings();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  uId = prefs.getString("uId");
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthPro()),
        ChangeNotifierProvider(create: (_) => QuesAnsPro()),
        ChangeNotifierProvider(create: (_) => NewsPro()),
        ChangeNotifierProvider(create: (_) => SellerProductPro()),
        ChangeNotifierProvider(create: (_) => ProductsPro()),
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
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.btnColor,
          titleTextStyle: TextUtils.heading2,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: AppColor.themeColor,
      ),
      home: uId != null ? RootScreen() : LoginScreen(),
      // home: MarketModuleScreen(),
    );
  }
}
