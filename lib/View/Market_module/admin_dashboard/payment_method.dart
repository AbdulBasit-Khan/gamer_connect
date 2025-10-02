import 'package:flutter/material.dart';

class PaymentsPanel extends StatelessWidget {
  final List<Map<String, String>> payments = [
    {'buyer': 'Ahmed Raza', 'item': 'MacBook Pro', 'status': 'Pending'},
    {'buyer': 'Sara Malik', 'item': 'Samsung TV', 'status': 'Confirmed'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: payments.map((p) => ListTile(
        title: Text('${p['item']}'),
        subtitle: Text('Buyer: ${p['buyer']} - Status: ${p['status']}'),
      )).toList(),
    );
  }
}
