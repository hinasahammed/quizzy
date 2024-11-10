import 'package:flutter/material.dart';
import 'package:quizzy/model/questionSummary/question_summary_model.dart';
import 'package:quizzy/repository/storageRepository/storage_repository.dart';

class QuizController extends ChangeNotifier {
  QuizController({
    required StorageRepository storageRepository,
  }) : _storageRepository = storageRepository;

  final StorageRepository _storageRepository;

  void saveQuiz(QuestionSummaryModel quizSummary) async {
    await _storageRepository.saveQuizSummary(quizSummary);
  }

  String fetchId() {
    var id = _storageRepository.fetchId();
    return id;
  }
}
