import 'package:flutter/material.dart';

class ContactRequestsPanel extends StatelessWidget {
  final List<Map<String, String>> requests = [
    {'user': 'Ahmed Raza', 'contacted': 'John Doe'},
    {'user': 'Sara Malik', 'contacted': 'Ali Khan'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: requests.map((r) => ListTile(
        title: Text('${r['user']} contacted ${r['contacted']}'),
      )).toList(),
    );
  }
}
