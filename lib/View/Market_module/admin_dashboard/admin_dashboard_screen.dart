import 'package:flutter/material.dart';
import 'package:market_module/Market_module/admin_dashboard/buyer_confirmation_pannel.dart';
import 'package:market_module/Market_module/admin_dashboard/contact_request.dart';
import 'package:market_module/Market_module/admin_dashboard/payment_method.dart';
import 'package:market_module/Market_module/admin_dashboard/verified_user_pannel.dart';


class AdminDashboardScreen extends StatefulWidget {
  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int selectedIndex = 0;

  final List<Widget> panels = [
    VerifiedUsersPanel(),
    PaymentsPanel(),
    ContactRequestsPanel(),
    BuyerConfirmationsPanel(),
  ];

  final List<String> titles = [
    'Verified Users',
    'Payments in Progress',
    'Contact Requests',
    'Buyer Confirmations',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.verified_user),
                label: Text('Users'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.payment),
                label: Text('Payments'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.contact_mail),
                label: Text('Contacts'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.check_circle),
                label: Text('Confirmations'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Column(
              children: [
                AppBar(
                  title: Text(titles[selectedIndex]),
                  automaticallyImplyLeading: false,
                ),
                Expanded(child: panels[selectedIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
