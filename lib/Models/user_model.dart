import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final DateTime createdAt;
  final String phone;
  final String name;
  final String email;
  final String profile;

  // Newly added nullable fields
  final int? approvalStatus;
  final String? cnicFront;
  final String? cnicBack;
  final bool? isSeller;
  final String? shopName;
  final String? shopAddress;
  final String? shopContact;
  final DateTime? becameSellerAt;

  UserModel({
    required this.uid,
    required this.createdAt,
    required this.phone,
    required this.name,
    required this.profile,
    required this.email,
    this.approvalStatus,
    this.cnicFront,
    this.cnicBack,
    this.isSeller,
    this.shopName,
    this.shopAddress,
    this.shopContact,
    this.becameSellerAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      profile: map['profile'] ?? '',
      createdAt: (map['createdAt'] is Timestamp)
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      phone: map['phone']?.toString() ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',

      // New fields
      approvalStatus: map['approvalStatus'] ?? 0,
      cnicFront: map['cnicFront'],
      cnicBack: map['cnicBack'],
      isSeller: map['isSeller'] ?? false,
      shopName: map['shopName'],
      shopAddress: map['shopAddress'],
      shopContact: map['shopContact']?.toString(),
      becameSellerAt: (map['becameSellerAt'] is Timestamp)
          ? (map['becameSellerAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'createdAt': createdAt,
      'phone': phone,
      'name': name,
      'profile': profile,
      'email': email,

      // New fields
      'approvalStatus': approvalStatus,
      'cnicFront': cnicFront,
      'cnicBack': cnicBack,
      'isSeller': isSeller,
      'shopName': shopName,
      'shopAddress': shopAddress,
      'shopContact': shopContact,
      'becameSellerAt': becameSellerAt,
    };
  }
}
