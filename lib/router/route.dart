// lib/routes/app_routes.dart
import 'package:flutter/material.dart';
import '../home.screen.dart';
import '../login.screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Kiểm tra tên route
  switch (settings.name) {
    case '/login':
      return MaterialPageRoute(builder: (context) => LoginScreen());

    case '/':
      final String username = settings.arguments as String? ??
          ''; // Nếu không có thì mặc định là ''
      return MaterialPageRoute(
        builder: (context) => HomeScreen(username: username),
      );

    default:
      // Route không tồn tại, chuyển đến ErrorScreen
      return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}
