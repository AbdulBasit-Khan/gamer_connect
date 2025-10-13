import 'package:flutter/material.dart';

class UserCommunicationScreen extends StatefulWidget {
  const UserCommunicationScreen({super.key});

  @override
  State<UserCommunicationScreen> createState() => _UserCommunicationScreenState();
}

class _UserCommunicationScreenState extends State<UserCommunicationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('User communication screen'),
      ),
    );
  }
}