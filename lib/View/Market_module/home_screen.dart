import 'package:flutter/material.dart';
import 'package:gamerconnect/View/Market_module/Listed_item_screen.dart';
import 'package:gamerconnect/View/Market_module/admin_dashboard/admin_dashboard_screen.dart';
import 'package:gamerconnect/View/Market_module/buyer_screens/buyer_history_screen.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<Widget> screen = [
    ListedItemScreen(),
    BuyerHistoryScreen(),
    AdminDashboardScreen()
   ];

    int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: screen[current_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index){
         setState(() {
           current_index = index;
         });
        },
        
        items: [
            BottomNavigationBarItem(
              
              label:'Home',
              icon: Icon(

              Icons.home , color: Colors.white, )),
              BottomNavigationBarItem(
                label:'History',
                icon: Icon(
              Icons.history , color: Colors.white,)),
              BottomNavigationBarItem(
                label:'dashboard',
                icon: Icon(
              Icons.admin_panel_settings_rounded , color: Colors.white,)),
      ]),
    );
  }
}
