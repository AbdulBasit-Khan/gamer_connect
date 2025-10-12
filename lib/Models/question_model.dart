import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final DateTime createdAt;
  final String profile;
  final int id;
  final String title;
  final String name;
  final String body;
  final String userId;
  final int answerCount;

  QuestionModel({
    required this.createdAt,
    required this.profile,
    required this.id,
    required this.answerCount,
    required this.title,
    required this.name,
    required this.body,
    required this.userId,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      profile: map['profile'],
      id: map['id'],
      title: map['title'],
      answerCount: map['answerCount'] ?? 0,
      body: map['body'],
      name: map['name'] ?? "Anonymous",
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': Timestamp.fromDate(createdAt),
      'profile': profile,
      'id': id,
      'title': title,
      'name': name,
      'body': body,
      'userId': userId,
      'answerCount': answerCount,
    };
  }
}
