import 'package:flutter/material.dart';
import 'package:mvvm_provider_dio/views/home/home_screen.dart';
import 'package:mvvm_provider_dio/views/userdetail/userdetail_screen.dart';

class AppRoutes {
  // Router map key
  static const String home = 'home';
  static const String user = 'user';
  static const String userdetail = 'userdetail';

  // Router Map
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    userdetail: (context) => const UserDetailScreen(),
  };
}
