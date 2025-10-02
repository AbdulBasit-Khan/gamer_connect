import 'package:flutter/material.dart';
import 'package:gamerconnect/View/Market_module/admin_payment_release_screen.dart';

class PaymentScreen extends StatefulWidget {
  final Map<String,String> item;
  const PaymentScreen({super.key, required this.item});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Item: ${widget.item['name']}'),
            Text('Price: ${widget.item['price']}'),
            Text('Payment sent to Admin'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPaymentReleaseScreen()));
              },
              child: Text('Confirm Item Received'),
            ),
          ],
        ),
      ),
    );
  }
}