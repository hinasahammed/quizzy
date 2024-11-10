// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuestionSummaryModel {
  QuestionSummaryModel({
    required this.id,
    required this.userId,
    required this.correctAnswersCount,
    required this.answeredCount,
    required this.skippedCount,
    required this.quizPoint,
  });

  final String id;
  final String userId;
  final int correctAnswersCount;
  final int answeredCount;
  final int skippedCount;
  final double quizPoint;

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'correctAnswersCount': correctAnswersCount,
      'answeredCount': answeredCount,
      'skippedCount': skippedCount,
      'quizPoint': quizPoint,
    };
  }

  factory QuestionSummaryModel.fromMap(Map<String, dynamic> map) {
    return QuestionSummaryModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      correctAnswersCount: map['correctAnswersCount'] as int,
      answeredCount: map['answeredCount'] as int,
      skippedCount: map['skippedCount'] as int,
      quizPoint: map['quizPoint'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionSummaryModel.fromJson(String source) => QuestionSummaryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
