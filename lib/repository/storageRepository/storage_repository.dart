import 'package:quizzy/model/user/user_model.dart';

abstract class StorageRepository {
  Future<List<UserModel>> getAllUsers();

  Future addUSer(List<UserModel> user);

  Future setUserLogedin(String id);

  Future<String> getUserLogedin();
}
