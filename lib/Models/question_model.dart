import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final DateTime createdAt;
  final String profile;
  final int id;
  final String title;
  final String body;
  final String userId;

  QuestionModel({
    required this.createdAt,
    required this.profile,
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      profile: map['profile'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': Timestamp.fromDate(createdAt),
      'profile': profile,
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
    };
  }
}
