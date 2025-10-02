import 'package:flutter/material.dart';
import 'package:market_module/Market_module/home_screen.dart';

class AdminPaymentReleaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Payment Release')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Buyer: Ali Khan'),
            Text('Item: MacBook Pro'),
            Text('Status: Verified by Buyer'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              },
              child: Text('Release Payment to Seller'),
            ),
          ],
        ),
      ),
    );
  }
}
