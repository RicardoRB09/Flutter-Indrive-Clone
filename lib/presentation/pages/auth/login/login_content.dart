import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Welcome',
            style: TextStyle(),
          ),
          Text(
            'back User',
            style: TextStyle(),
          ),
          TextFormField()
        ],
      ),
    );
  }
}
