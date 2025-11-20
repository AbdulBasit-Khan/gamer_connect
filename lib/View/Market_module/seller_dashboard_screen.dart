import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamerconnect/Components/order_card.dart';
import 'package:gamerconnect/View/Market_module/add_item_screen.dart';
import 'package:gamerconnect/providers/auth_pro.dart';
import 'package:provider/provider.dart';

class SellerDashboardScreen extends StatelessWidget {
  final List<String> items = [
    'iPhone 13 - Rs. 180,000',
    'Samsung TV - Rs. 95,000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddItemScreen()));
        },
        child: Text('Add New Item'),
      ),
      appBar: AppBar(title: Text('Seller Dashboard')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('orders')
            .where(
              "sellerId",
              isEqualTo: Provider.of<AuthPro>(
                context,
                listen: false,
              ).userData!.uid,
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (!snapshot.hasData) {
            return const Text("No orders to show");
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (Context, index) {
              return OrderCard(
                imageUrl: snapshot.data!.docs[index].data()['productImage'],
                orderId: snapshot.data!.docs[index].data()['productName'],
                customerName: snapshot.data!.docs[index].data()['address'],
                orderDate: snapshot.data!.docs[index].data()['phone'],
                orderStatus: "Pending",
                onView: () {
                  print("View Order");
                },
                onAccept: () {
                  print("Order Accepted");
                },
                onReject: () {
                  print("Order Rejected");
                },
              );
            },
          );
        },
      ),
    );
  }
}
