import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future register(BuildContext context,String userName,String mobileNumber,String password);
  Future login(BuildContext context, String mobileNumber,String password);
}
