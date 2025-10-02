import 'package:flutter/material.dart';

class AdminVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Verification')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Seller: John Doe'),
            ListTile(title: Text('ID Card'), trailing: Icon(Icons.check)),
            ListTile(title: Text('License'), trailing: Icon(Icons.check)),
            TextField(decoration: InputDecoration(labelText: 'Notes')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sellerDashboard');
              },
              child: Text('Approve Seller'),
            ),
          ],
        ),
      ),
    );
  }
}
