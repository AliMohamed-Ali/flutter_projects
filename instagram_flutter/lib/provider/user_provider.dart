import 'package:flutter/material.dart';
import 'package:instagram_flutter/model/user_model.dart';
import 'package:instagram_flutter/resources/auth_method.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  final AuthMethods _authMethods = AuthMethods();
  UserModel get getUser => _user!;
  Future refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
