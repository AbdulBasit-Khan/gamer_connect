import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gamerconnect/Components/drawer_component.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/Auth/login_screen.dart';
import 'package:gamerconnect/View/New_Screens/new_screen.dart';
import 'package:gamerconnect/View/QuestionAnswer_Screen/question_screen.dart';
import 'package:gamerconnect/View/Vender_Verification_Screens/verification_step1.dart';
import 'package:gamerconnect/View/home_screen.dart';
import 'package:gamerconnect/View/profile.screen.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final searchController = TextEditingController();
  FlutterCarouselController buttonCarouselController =
      FlutterCarouselController();
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screen = const [
    HomeScreen(),
    NewsScreen(),
    QuestionScreen(),
    ProfileScreen(),
  ];
  final List<String> title = [
    'Gamer Connect',
    'ChatScreen',
    'Question Screen',
    'Profile Screen',
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((val) {
      Provider.of<AuthPro>(context, listen: false).getProfile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // dismisses the keyboard
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.btnColor,
            title: Text(title[_currentIndex], style: TextUtils.heading2),
            centerTitle: true,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                onPressed: () {
                  Scaffold.of(
                    context,
                  ).openDrawer(); // Correct context for opening the drawer
                },
              ),
            ),
          ),

          drawer: Drawer(
            backgroundColor: AppColor.themeColor,
            child: Column(
              children: [
                DrawerHeader(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(radius: 30, child: Text('1')),
                      SizedBox(height: 10),
                      Text(
                        "Wasim Akram Janyaro",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        "wasayojanyaro@gmail.com",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView(
                    children: [
                      DrawerComponent(
                        onTap: () {},
                        icondata: Icons.home,
                        iconName: 'Home',
                      ),

                      DrawerComponent(
                        onTap: () {},
                        icondata: Icons.home,
                        iconName: 'News',
                      ),
                      DrawerComponent(
                        onTap: () {},
                        icondata: Icons.question_answer,
                        iconName: 'Questions',
                      ),
                      DrawerComponent(
                        onTap: () {},
                        icondata: Icons.chat,
                        iconName: 'ChatBot',
                      ),
                      DrawerComponent(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove("uId");
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                              child: const LoginScreen(),
                              type: PageTransitionType.bottomToTop,
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        icondata: Icons.logout,
                        iconName: 'Logout',
                      ),
                    ],
                  ),
                ),

                /// **Button at the Bottom**
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Reusebtn(
                    title: 'Become a seller',
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VerificationStep1(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          body: _screen[_currentIndex],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColor.btnColor,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: AppColor.themeColor,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.chat),
                  label: 'Search',
                  backgroundColor: AppColor.themeColor,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.question_answer),
                  label: 'Questions',
                  backgroundColor: AppColor.themeColor,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: 'Profile',
                  backgroundColor: AppColor.themeColor,
                ),
              ],
              currentIndex: _currentIndex,
              selectedItemColor: AppColor.btnColor,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
