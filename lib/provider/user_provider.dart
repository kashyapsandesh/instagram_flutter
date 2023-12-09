import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/user_modal.dart';
import 'package:instagram_flutter/resources/auth_method.dart';

class UserProvider extends ChangeNotifier {
  final AuthMethods _authMethods = AuthMethods();
  User? _user;
  User get getUser => _user!;
  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
