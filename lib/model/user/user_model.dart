import 'dart:convert';

class UserModel {
  UserModel({
    required this.id,
    required this.userName,
    required this.mobileNumber,
    required this.password,
    this.isAdmin = false, 
  });

  final String id;
  final bool isAdmin;
  final String userName;
  final String mobileNumber;
  final String password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'mobileNumber': mobileNumber,
      'password': password,
      'isAdmin': isAdmin, 
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      userName: map['userName'] as String,
      mobileNumber: map['mobileNumber'] as String,
      password: map['password'] as String,
      isAdmin: map['isAdmin'] as bool? ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
