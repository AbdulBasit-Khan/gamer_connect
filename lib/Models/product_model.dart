import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String sellerId;
  final String name;
  final String sellerShopName;
  final String sellerProfile;
  final String sellerContact;
  final String description;
  final String category;
  final double price;
  final List images;
  final Timestamp createdAt;

  ProductModel({
    required this.id,
    required this.sellerId,
    required this.name,
    required this.sellerShopName,
    required this.sellerProfile,
    required this.sellerContact,
    required this.description,
    required this.category,
    required this.price,
    required this.images,
    required this.createdAt,
  });

  // Factory constructor to create a Product from Firestore data
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'].toString(),
      sellerId: map['sellerId'] ?? '',
      name: map['name'] ?? '',
      sellerShopName: map['sellerShopName'] ?? '',
      sellerContact: map['sellerContact'] ?? '',
      sellerProfile: map['sellerProfile'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] is int)
          ? (map['price'] as int).toDouble()
          : (map['price'] ?? 0.0),
      images: map['images'],
      createdAt: map['createdAt'] ?? Timestamp.now(),
    );
  }

  // Convert Product to Map for uploading to Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sellerId': sellerId,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'images': images,
      'createdAt': createdAt,
    };
  }
}
