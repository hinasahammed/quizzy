import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showCustomToast(String message) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message);
  }
}
