import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizzy/repository/storageRepository/storage_repository.dart';
import 'package:quizzy/view/bottomNavigation/custom_bottom_navigation.dart';
import 'package:quizzy/view/login/login_view.dart';

class SplashServices {
  SplashServices({
    required StorageRepository storageRepository,
  }) : _storageRepository = storageRepository;

  final StorageRepository _storageRepository;

  void isUserLogedin(BuildContext context) {
    var userLogedin = _storageRepository.getUserLogedin();

    Timer(
      const Duration(seconds: 3),
      () {
        if (userLogedin.isEmpty) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ));
        } else {
          var val = jsonDecode(userLogedin);

          if (val['isLogedIn'] == "true") {
            if (context.mounted) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomBottomNavigation(),
                  ));
            }
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ));
          }
        }
      },
    );
  }
}
