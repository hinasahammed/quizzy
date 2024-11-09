import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizzy/repository/storageRepository/storage_repository.dart';
import 'package:quizzy/view/bottomNavigation/custom_bottom_navigation.dart';

class SplashServices {
  SplashServices({
    required StorageRepository storageRepository,
  }) : _storageRepository = storageRepository;

  final StorageRepository _storageRepository;

  void isUserLogedin(BuildContext context) async {
    var userLogedin = await _storageRepository.getUserLogedin();
    var val = jsonDecode(userLogedin);
    Timer(
      const Duration(seconds: 3),
      () {
        if (val['isLogedIn'] == "true") {
          if (context.mounted) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomBottomNavigation(),
                ));
          }
        }
      },
    );
  }
}
