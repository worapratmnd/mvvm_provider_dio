import 'package:flutter/material.dart';
import 'package:mvvm_provider_dio/app.dart';
import 'package:mvvm_provider_dio/models/user_model.dart';
import 'package:mvvm_provider_dio/services/user_api.dart';

class UserViewModel extends ChangeNotifier {
  // Create User api service instance
  final UserAPIService _userApiService = UserAPIService();

  // Create list of users
  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  // Fetch users
  Future<void> fetchUsers() async {
    try {
      _users = await _userApiService.getUsers();
      notifyListeners();
    } catch (e) {
      logger.e('Error fetchUsers: $e');
    }
  }
}
