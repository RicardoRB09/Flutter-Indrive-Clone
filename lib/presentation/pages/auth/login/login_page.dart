import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone/presentation/pages/auth/login/login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      // backgroundColor: Color(0xFF4B4B4B),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return LoginContent(bloc: _bloc);
        },
      ),
    );
  }
}
