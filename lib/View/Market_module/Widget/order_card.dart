import 'package:flutter/material.dart';
import 'package:gamerconnect/View/Market_module/Model/order.dart';
class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onConfirm;
  final VoidCallback onClaim;

  const OrderCard({
    Key? key,
    required this.order,
    required this.onConfirm,
    required this.onClaim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(order.imageUrl),
                  radius: 30,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.itemName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('Price: ${order.price}'),
                      Text('Seller: ${order.seller}'),
                      Text('Order Date: ${_formatDate(order.orderDate)}'),
                      Text('Status: ${_getStatusText(order.status)}'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatusButton(),
                ),
                SizedBox(width: 8),
                if (order.status == 'delivered' || order.status == 'disputed')
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onClaim,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        order.status == 'disputed' ? 'View Claim' : 'Claim Issue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton() {
    switch (order.status) {
      case 'delivered':
        return ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Text(
            'Confirm Receipt',
            style: TextStyle(color: Colors.white),
          ),
        );
      case 'confirmed':
        return ElevatedButton(
          onPressed: null,
          child: Text('Confirmed ✓'),
        );
      case 'disputed':
        return ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
          child: Text(
            'Under Review',
            style: TextStyle(color: Colors.white),
          ),
        );
      default:
        return ElevatedButton(
          onPressed: null,
          child: Text('Pending'),
        );
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'pending': return 'Pending Delivery';
      case 'delivered': return 'Delivered - Confirm Receipt';
      case 'confirmed': return 'Confirmed ✓';
      case 'disputed': return 'Claim Filed - Under Review';
      default: return status;
    }
  }
}