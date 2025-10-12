import 'package:cloud_firestore/cloud_firestore.dart';

class AnswerModel {
  final DateTime createdAt;
  final int questionId;
  final String answer;
  final String profile;
  final String name;
  final int id;
  final String userId;

  AnswerModel({
    required this.createdAt,
    required this.questionId,
    required this.answer,
    required this.profile,
    required this.name,
    required this.id,
    required this.userId,
  });

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    // Firebase Timestamp structure: Timestamp(seconds, nanoseconds)
    // final timestamp = map['createdAt'];
    // DateTime createdAt = DateTime.fromMillisecondsSinceEpoch(
    //   timestamp['seconds'] * 1000 + (timestamp['nanoseconds'] ~/ 1000000),
    // );

    return AnswerModel(
      questionId: map['questionId'],
      answer: map['answer'],
      profile: map['profile'],
      name: map['name'],
      createdAt: map['createdAt'].toDate(),
      id: map['id'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': {
        'seconds': createdAt.millisecondsSinceEpoch ~/ 1000,
        'nanoseconds': (createdAt.millisecondsSinceEpoch % 1000) * 1000000,
      },
      'questionId': questionId,
      'answer': answer,
      'profile': profile,
      'name': name,
      'id': id,
      'userId': userId,
    };
  }
}
