import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final DateTime createdAt;
  final String phone;
  final String name;
  final String email;
  final String profile;

  UserModel({
    required this.uid,
    required this.createdAt,
    required this.phone,
    required this.name,
    required this.profile,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      profile: map['profile'] ?? "",
      createdAt: (map['createdAt'] as Timestamp)
          .toDate(), // Assuming Firestore Timestamp
      phone: map['phone'],
      name: map['name'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'createdAt':
          createdAt, // This will need conversion if saving to Firestore
      'phone': phone,
      'name': name,
      'profile': profile,
      'email': email,
    };
  }
}
