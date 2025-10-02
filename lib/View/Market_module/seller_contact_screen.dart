import 'package:flutter/material.dart';

class SellerContactScreen extends StatefulWidget {
  final Map<String , String> item;
  const SellerContactScreen({super.key, required this.item});

  @override
  State<SellerContactScreen> createState() => _SellerContactScreenState();
}

class _SellerContactScreenState extends State<SellerContactScreen> {
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Contact Seller')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Seller: ${widget.item['seller']}'),
            Text('Email: john@example.com'),
            Text('Phone: +92-300-1234567'),
          ],
        ),
      ),
    );
  }
}
