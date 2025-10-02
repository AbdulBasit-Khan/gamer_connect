import 'package:flutter/material.dart';
import 'package:gamerconnect/View/Market_module/Model/order.dart';
import 'package:gamerconnect/View/Market_module/Widget/order_card.dart';
import 'package:gamerconnect/View/Market_module/buyer_screens/claim_screen.dart';

class BuyerHistoryScreen extends StatelessWidget {
  final List<Order> orders = [
    // Sample data - replace with your actual data source
    Order(
      orderId: 'ORD-001',
      itemName: 'iPhone 13',
      price: '\$699',
      seller: 'TechStore',
      orderDate: DateTime(2024, 1, 15),
      status: 'delivered',
      imageUrl: 'https://example.com/iphone13.jpg',
      trackingNumber: 'TRK123456789',
    ),
    Order(
      orderId: 'ORD-002',
      itemName: 'Nike Shoes',
      price: '\$120',
      seller: 'SportsWorld',
      orderDate: DateTime(2024, 1, 10),
      status: 'confirmed',
      imageUrl: 'https://example.com/nikeshoes.jpg',
      trackingNumber: 'TRK987654321',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderCard(
            order: orders[index],
            onConfirm: () => _showConfirmationDialog(context, orders[index]),
            onClaim: () => _navigateToClaimScreen(context, orders[index]),
          );
        },
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Receipt'),
          content: Text('Are you sure you have received the item and it matches the description?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _confirmOrder(order);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order confirmed successfully!')),
                );
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _confirmOrder(Order order) {
    // Update order status in your database
    print('Order ${order.orderId} confirmed');
    // Implement your backend logic here
  }

  void _navigateToClaimScreen(BuildContext context, Order order) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClaimScreen(order: order),
      ),
    );
  }
}