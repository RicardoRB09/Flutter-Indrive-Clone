import 'package:flutter/material.dart';
import 'package:indriver_clone/presentation/pages/auth/login/login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Color(0xFF4B4B4B),
      body: LoginContent(),
    );
  }
}
