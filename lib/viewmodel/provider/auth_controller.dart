import 'package:flutter/material.dart';
import 'package:quizzy/repository/authRepository/auth_repository.dart';

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
    await _authRepository.register(
      context,
      userName,
      mobileNumber,
      password,
    );
  }

  void login(BuildContext context, String mobilenumber, String password) async {
    await _authRepository.login(
      context,
      mobilenumber,
      password,
    );
  }
}
