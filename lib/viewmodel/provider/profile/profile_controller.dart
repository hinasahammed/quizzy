
import 'package:flutter/material.dart';
import 'package:quizzy/model/user/user_model.dart';
import 'package:quizzy/repository/storageRepository/storage_repository.dart';
import 'package:quizzy/view/login/login_view.dart';

class ProfileController extends ChangeNotifier {
  ProfileController({
    required StorageRepository storageRepository,
  }) : _storageRepository = storageRepository;

  final StorageRepository _storageRepository;

  void logout(BuildContext context) async {
    var id = _storageRepository.fetchId();
    await _storageRepository.setUserLogedin(id, "false").then((value) {
      if (context.mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ));
      }
    });
  }

  UserModel getCurrentUser() {
    var id = _storageRepository.fetchId();
    var user = _storageRepository.fetchCurrentUser(id);
    return user;
  }
}
