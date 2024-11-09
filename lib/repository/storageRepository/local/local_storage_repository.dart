import 'dart:convert';

import 'package:quizzy/model/user/user_model.dart';
import 'package:quizzy/repository/storageRepository/storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _userKey = "all_user";
const _userLogedIn = "user_loged_in";

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
  Future setUserLogedin(String id) async {
    var value = {
      "isLogedIn": "true",
      "user_id": id,
    };
    await _sharedPreferences.setString(
      _userLogedIn,
      jsonEncode(value),
    );
  }

  @override
  Future<String> getUserLogedin() async {
    var val = _sharedPreferences.getString(_userLogedIn) ?? '';
    return val;
  }
}
