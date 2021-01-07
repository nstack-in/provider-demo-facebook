import 'package:flutter/material.dart';

class HireProvider extends ChangeNotifier {
  List<Map> _users = [];

  List<Map> get users => _users;

  void addPeople(Map user) {
    Map isAvailable = _users.firstWhere(
      (element) => element['id'] == user['id'],
      orElse: () => null,
    );
    if (isAvailable == null) {
      _users.add(user);
    }
    notifyListeners();
  }

  void removePeople(Map user) {
    _users.removeWhere((u) => u['id'] == user['id']);
    notifyListeners();
  }

  void emptyPeople(Map user) {
    _users = [];
    notifyListeners();
  }
}
