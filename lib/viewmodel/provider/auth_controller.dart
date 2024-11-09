import 'package:flutter/material.dart';
import 'package:quizzy/repository/authRepository/auth_repository.dart';
import 'package:quizzy/utils/utils.dart';
import 'package:quizzy/view/login/login_view.dart';

class AuthController with ChangeNotifier {
  AuthController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  void registerUser(
    BuildContext context,
    String userName,
    String mobileNumber,
    String password,
  ) async {
    await _authRepository
        .register(
      userName,
      mobileNumber,
      password,
    )
        .then(
      (value) {
        if (context.mounted) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ));
          Utils.showCustomToast("Account created successfully! try to login");
        }
      },
    );
  }

  void login(BuildContext context, String mobilenumber, String password) async {
    await _authRepository.login(context, mobilenumber, password);
  }
}
