import 'package:flutter/material.dart';

class BuyerConfirmationsPanel extends StatelessWidget {
  final List<Map<String, String>> confirmations = [
    {'buyer': 'Ahmed Raza', 'item': 'MacBook Pro', 'status': 'Not Confirmed'},
    {'buyer': 'Sara Malik', 'item': 'Samsung TV', 'status': 'Confirmed'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: confirmations.map((c) => ListTile(
        title: Text('${c['buyer']} - ${c['item']}'),
        subtitle: Text('Status: ${c['status']}'),
      )).toList(),
    );
  }
}
