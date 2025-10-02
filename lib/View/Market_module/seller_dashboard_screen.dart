import 'package:flutter/material.dart';

class SellerDashboardScreen extends StatelessWidget {
  final List<String> items = ['iPhone 13 - Rs. 180,000', 'Samsung TV - Rs. 95,000'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seller Dashboard')),
      body: Column(
        children: [
          Text('Welcome, John!', style: TextStyle(fontSize: 18)),
          ...items.map((item) => ListTile(title: Text(item))),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addItem');
            },
            child: Text('Add New Item'),
          ),
        ],
      ),
    );
  }
}
