import 'package:flutter/material.dart';

class VerifiedUsersPanel extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'John Doe',
      'email': 'john@example.com',
      'items': ['MacBook Pro', 'iPhone 13']
    },
    {
      'name': 'Ali Khan',
      'email': 'ali@example.com',
      'items': ['Samsung TV']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: users.map((user) => Card(
        child: ListTile(
          title: Text(user['name']),
          subtitle: Text(user['email']),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${user['name']} deleted')),
              );
            },
          ),
          onTap: () {
            Navigator.pushNamed(context, '/userItems', arguments: user);
          },
        ),
      )).toList(),
    );
  }
}
