
import 'package:flutter/material.dart';
import 'package:quizzy/model/user/user_model.dart';
import 'package:quizzy/repository/authRepository/auth_repository.dart';
import 'package:quizzy/repository/storageRepository/local/local_storage_repository.dart';
import 'package:quizzy/utils/utils.dart';
import 'package:quizzy/view/bottomNavigation/custom_bottom_navigation.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class LocalAuthRepository implements AuthRepository {
  final LocalStorageRepository _localStorageRepository;

  LocalAuthRepository({
    required LocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  @override
  Future register(String userName, String mobileNumber, String password) async {
    final user = UserModel(
      id: uuid.v4(),
      userName: userName,
      mobileNumber: mobileNumber,
      password: password,
    );

    var userStorage = await _localStorageRepository.getAllUsers();
    if (userStorage.isEmpty) {
      userStorage.add(user);
      _localStorageRepository.addUSer(userStorage);
    } else {
      var isAlreadyUser = userStorage
          .where((element) => element.mobileNumber == mobileNumber)
          .toList();
      if (isAlreadyUser.isEmpty) {
        userStorage.add(user);
        _localStorageRepository.addUSer(userStorage);
      } else {
        Utils.showCustomToast("MOBILE_ALREADY_IN_USE");
      }
    }
  }

  @override
  Future login(
      BuildContext context, String mobileNumber, String password) async {
    var userStorage = await _localStorageRepository.getAllUsers();
    var userAccount = userStorage
        .where(
          (element) =>
              element.mobileNumber == mobileNumber &&
              element.password == password,
        )
        .toList();
    if (userAccount.isNotEmpty) {
      await _localStorageRepository.setUserLogedin(userAccount[0].id).then(
        (value) {
          if (context.mounted) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomBottomNavigation(),
                ));

            Utils.showCustomToast("Login sucessfull");
          }
        },
      );
    } else {
      Utils.showCustomToast("Check Credential");
    }
  }
}
