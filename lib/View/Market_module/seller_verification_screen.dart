import 'package:flutter/material.dart';

class SellerVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seller Verification')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Full Name')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(decoration: InputDecoration(labelText: 'Phone')),
            TextField(decoration: InputDecoration(labelText: 'CNIC')),
            TextField(decoration: InputDecoration(labelText: 'Business Name')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/adminVerification');
              },
              child: Text('Submit for Verification'),
            ),
          ],
        ),
      ),
    );
  }
}
