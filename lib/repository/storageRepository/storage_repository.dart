import 'package:quizzy/model/questionSummary/question_summary_model.dart';
import 'package:quizzy/model/user/user_model.dart';

abstract class StorageRepository {
  Future<List<UserModel>> getAllUsers();

  Future addUSer(List<UserModel> user);

  Future setUserLogedin(String id, String loginBool);

  String getUserLogedin();

  Future saveQuizSummary(QuestionSummaryModel quizSummary);

  String fetchId();

  UserModel fetchCurrentUser(String id);

  List<QuestionSummaryModel> fetchQuizSummary(String userId);
}
