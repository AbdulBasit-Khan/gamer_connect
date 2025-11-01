import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gamerconnect/Components/drawer_component.dart';
import 'package:gamerconnect/Components/reuse_btn.dart';
import 'package:gamerconnect/Utils/colors.dart';
import 'package:gamerconnect/Utils/text_utils.dart';
import 'package:gamerconnect/View/Auth/login_screen.dart';
import 'package:gamerconnect/View/Auth/edit_profile_screen.dart';
import 'package:gamerconnect/View/Market_module/admin_dashboard/admin_dashboard_screen.dart';
import 'package:gamerconnect/View/Market_module/buyer_screens/buyer_history_screen.dart';
import 'package:gamerconnect/View/Market_module/Listing%20Screens/market_module_screen.dart';
import 'package:gamerconnect/View/Market_module/seller_dashboard_screen.dart';
import 'package:gamerconnect/View/Market_module/selller_verification_pending_screen.dart';
import 'package:gamerconnect/View/New_Screens/new_screen.dart';
import 'package:gamerconnect/View/QuestionAnswer_Screen/question_screen.dart';
import 'package:gamerconnect/View/Vender_Verification_Screens/verification_step1.dart';
import 'package:gamerconnect/View/home_screen.dart';
import 'package:gamerconnect/View/profilecontent_screen.dart';
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

  final List<Widget> _screen = [
    HomeScreen(),
    NewsScreen(),
    QuestionScreen(),
    MarketModuleScreen(),
  ];
  final List<String> title = [
    'Gamer Connect',
    'ChatScreen',
    'Question Screen',
    'Market ',
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
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.btnColor,
            title: Text(title[_currentIndex], style: TextUtils.heading2),
            centerTitle: true,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Consumer<AuthPro>(
                  builder: (context, provider, child) {
                    return Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            provider.userData != null &&
                                    provider.userData!.profile != null &&
                                    provider.userData!.profile!.isNotEmpty
                                ? provider.userData!.profile!
                                : 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            // Show cart icon only on Profile screen (4th screen - index 3)
            actions: _currentIndex == 3
                ? [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BuyerHistoryScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                  ]
                : null,
          ),
          drawer: _buildDrawer(context),
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

  // Handle cart button press

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.themeColor,
      child: Column(
        children: [
          // Drawer Header with User Info
          Container(
            width: double.infinity,
            // height: 180,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.btnColor.withOpacity(0.1),
            ),
            child: Consumer<AuthPro>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Avatar
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            provider.userData != null &&
                                    provider.userData!.profile != null &&
                                    provider.userData!.profile!.isNotEmpty
                                ? provider.userData!.profile!
                                : 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // User Name
                    Text(
                      provider.userData?.name ?? 'User Name',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // User Email
                    Text(
                      provider.userData?.email ?? 'user@email.com',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Edit Profile Button
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileContentScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.btnColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.settings, color: Colors.white, size: 12),
                            SizedBox(width: 4),
                            Text(
                              'Setting',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Drawer Menu Items
          Expanded(
            child: ListView(
              children: [
                DrawerComponent(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  icondata: Icons.home,
                  iconName: 'Home',
                ),
                DrawerComponent(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  icondata: Icons.article,
                  iconName: 'News',
                ),
                DrawerComponent(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  icondata: Icons.question_answer,
                  iconName: 'Questions',
                ),
                DrawerComponent(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  icondata: Icons.chat,
                  iconName: 'ChatBot',
                ),
                // Add Cart option in drawer too (optional)
                DrawerComponent(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _currentIndex = 3; // Navigate to profile screen
                    });
                    // Open cart
                  },
                  icondata: Icons.shopping_cart,
                  iconName: 'Cart',
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
          Provider.of<AuthPro>(context, listen: false).userData == null
              ? SizedBox()
              : Provider.of<AuthPro>(context, listen: false).userData!.isSeller!
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Reusebtn(
                    title: 'Seller Dashboard',
                    ontap: () {
                      Navigator.pop(context);
                      if (Provider.of<AuthPro>(
                            context,
                            listen: false,
                          ).userData!.approvalStatus ==
                          0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SellerVerificationPending(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SellerDashboardScreen(),
                          ),
                        );
                      }
                    },
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Reusebtn(
                    title: 'Become a seller',
                    ontap: () {
                      Navigator.pop(context);
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
    );
  }
}
