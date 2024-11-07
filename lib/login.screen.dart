import 'package:flutter/material.dart';
import 'untils/validator.dart';
import 'untils/show_error_dialog.service.dart';
import 'home.screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameControl = TextEditingController();
  final TextEditingController _passwordControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/login.png',
            width: 200,
          ),
          TextField(
              controller: _usernameControl,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              )),
          const SizedBox(height: 16),
          TextField(
              controller: _passwordControl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'password',
                border: OutlineInputBorder(),
              )),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              final username = _usernameControl.text;
              final password = _passwordControl.text;
              List<String>? passwordErrorMessage =
                  Validator.validatePassword(password);
              List<String>? usernameErrorMessage =
                  Validator.validateUsername(username);

              if (passwordErrorMessage != null &&
                  passwordErrorMessage.isNotEmpty) {
                showErrorDialog(context, passwordErrorMessage);
                return;
              }

              if (usernameErrorMessage != null &&
                  usernameErrorMessage.isNotEmpty) {
                showErrorDialog(context, usernameErrorMessage);
                return;
              }
              final result =
                  await Navigator.pushNamed(context, '/', arguments: username);
              //chuyển đến route "/"
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomeScreen(
              //         username: username), // Truyền tham số vào constructor
              //   ),
              // );
              if (result != null) {
                print('dữ liệu nhận được từ home là: ${result} ');
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    ));
  }
}
