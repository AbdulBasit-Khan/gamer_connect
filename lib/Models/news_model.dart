import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String imageUrl;
  final Timestamp createdAt;
  final String description;
  final String id;
  final String title;

  NewsModel({
    required this.imageUrl,
    required this.createdAt,
    required this.description,
    required this.id,
    required this.title,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      imageUrl: json['image'] ?? '',
      createdAt: json['createdAt'],
      description: json['description'] ?? '',
      id: json['id'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': imageUrl,
      'createdAt': {
        'seconds': createdAt.millisecondsSinceEpoch ~/ 1000,
        'nanoseconds': 0, // If you need nanoseconds, this could be extracted separately
      },
      'description': description,
      'id': id,
      'title': title,
    };
  }
}
