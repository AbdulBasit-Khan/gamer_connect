class Order {
  final String orderId;
  final String itemName;
  final String price;
  final String seller;
  final DateTime orderDate;
  final String status; // 'pending', 'delivered', 'confirmed', 'disputed'
  final String imageUrl;
  final String trackingNumber;

  Order({
    required this.orderId,
    required this.itemName,
    required this.price,
    required this.seller,
    required this.orderDate,
    required this.status,
    required this.imageUrl,
    required this.trackingNumber,
  });
}