import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String imageUrl;
  final String orderId;
  final String customerName;
  final String orderDate;
  final String orderStatus;
  final VoidCallback onView;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const OrderCard({
    super.key,
    required this.imageUrl,
    required this.orderId,
    required this.customerName,
    required this.orderDate,
    required this.orderStatus,
    required this.onView,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            /// --- IMAGE ---
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            /// --- ORDER DETAILS ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderId,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text("Address: $customerName"),
                  Text("Phone: $orderDate"),
                  // const SizedBox(height: 6),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //     vertical: 4,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.orange.shade100,
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Text(
                  //     orderStatus,
                  //     style: TextStyle(
                  //       color: Colors.orange.shade800,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            /// --- ACTION BUTTONS ---
            // Column(
            //   children: [
            //     IconButton(
            //       icon: const Icon(Icons.remove_red_eye),
            //       onPressed: onView,
            //     ),
            //     IconButton(
            //       icon: const Icon(Icons.check_circle, color: Colors.green),
            //       onPressed: onAccept,
            //     ),
            //     IconButton(
            //       icon: const Icon(Icons.cancel, color: Colors.red),
            //       onPressed: onReject,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
