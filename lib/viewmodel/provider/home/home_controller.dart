import 'package:flutter/material.dart';
import 'package:quizzy/model/questionSummary/question_summary_model.dart';
import 'package:quizzy/repository/storageRepository/storage_repository.dart';

class HomeController extends ChangeNotifier {
  HomeController({
    required StorageRepository storageRepository,
  }) : _storageRepository = storageRepository;

  final StorageRepository _storageRepository;

  List<QuestionSummaryModel> fetchQuizSummary() {
    var id = _storageRepository.fetchId();
    var val = _storageRepository.fetchQuizSummary(id);
    return val;
  }
}
