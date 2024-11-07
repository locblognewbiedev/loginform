import 'package:flutter/material.dart';
import 'router/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/login',
      onGenerateRoute:
          generateRoute, // Sử dụng generateRoute từ app_routes.dart
    );
  }
}
