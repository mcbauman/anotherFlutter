import 'package:flutter/material.dart';

class SettingsScreenNotifier extends ChangeNotifier {
  String _currentUser = "0";
  get currentUSer => _currentUser;
  void switchUser(String newUser) {
    _currentUser = newUser;
    notifyListeners();
  }
}
