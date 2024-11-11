import 'dart:convert';
import 'package:quizzy/model/questionSummary/question_summary_model.dart';
import 'package:quizzy/model/user/user_model.dart';
import 'package:quizzy/repository/storageRepository/storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _userKey = "all_users";
const _userLogedIn = "user_loged";
const _quizSummary = "quiz_summaries";

class LocalStorageRepository implements StorageRepository {
  final SharedPreferences _sharedPreferences;

  LocalStorageRepository({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<List<UserModel>> getAllUsers() async {
    final list = _sharedPreferences.getStringList(_userKey) ?? [];
    if (list.isEmpty) {
      return <UserModel>[];
    }

    return list.map((e) => UserModel.fromJson(json.decode(e))).toList();
  }

  @override
  Future addUSer(List<UserModel> userList) async {
    final stringList =
        userList.map((user) => json.encode(user.toJson())).toList();
    await _sharedPreferences.setStringList(_userKey, stringList);
  }

  @override
  Future setUserLogedin(String id, String loginBool) async {
    var value = {
      "isLogedIn": loginBool,
      "user_id": id,
    };
    await _sharedPreferences.setString(
      _userLogedIn,
      jsonEncode(value),
    );
  }

  @override
  String getUserLogedin() {
    var val = _sharedPreferences.getString(_userLogedIn) ?? '';
    return val;
  }

  @override
  Future saveQuizSummary(QuestionSummaryModel quizSummary) async {
    var storageQuizSummary =
        _sharedPreferences.getStringList(_quizSummary) ?? [];
    await _sharedPreferences.setStringList(
      _quizSummary,
      [...storageQuizSummary, quizSummary.toJson()],
    );
  }

  @override
  String fetchId() {
    var user = _sharedPreferences.getString(_userLogedIn) ?? '';
    if (user.isNotEmpty) {
      var decodedUser = jsonDecode(user);
      return decodedUser['user_id'];
    }

    return '';
  }

  @override
  UserModel fetchCurrentUser(String id) {
    List<UserModel> allUser = [];
    var userList = _sharedPreferences.getStringList(_userKey) ?? [];

    if (userList.isNotEmpty) {
      for (var userString in userList) {
        allUser.add(UserModel.fromJson(jsonDecode(userString)));
      }

      var currentUser = allUser.firstWhere(
        (element) => element.id == id,
        orElse: () =>
            UserModel(id: id, userName: "", mobileNumber: "", password: ""),
      );
      return currentUser;
    }

    return UserModel(
      id: id,
      userName: "",
      mobileNumber: "",
      password: "",
    );
  }

  @override
  List<QuestionSummaryModel> fetchQuizSummary(String userId) {
    List<QuestionSummaryModel> quizSummary = [];
    var summary = _sharedPreferences.getStringList(_quizSummary) ?? [];
    for (var i in summary) {
      quizSummary.add(QuestionSummaryModel.fromJson(i));
    }
    return quizSummary
        .where(
          (element) => element.userId == userId,
        )
        .toList();
  }
}
