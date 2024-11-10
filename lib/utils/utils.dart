import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showCustomToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message);
  }

  static void showAwesomeDialog(BuildContext context, DialogType dialogType,
      void Function()? btnOkOnPress) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: dialogType,
      title: 'Are you want to logout?',
      btnOkText: "Confirm",
      btnCancelText: "Cancel",
      btnCancelOnPress: () {},
      btnOkOnPress: btnOkOnPress,
    ).show();
  }
}
