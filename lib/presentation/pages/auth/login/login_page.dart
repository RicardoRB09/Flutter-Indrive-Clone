import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_clone/domain/utils/resource.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone/presentation/pages/auth/login/login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            Fluttertoast.showToast(
                msg: '${response.message}', timeInSecForIosWeb: 3);
            print('Error Data: ${response.message}');
          } else if (response is Success) {
            print('Success Dta: ${response.data}');
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final response = state.response;
            if (response is Loading) {
              return Stack(
                children: [
                  LoginContent(state: state),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            }
            return LoginContent(state: state);
          },
        ),
      ),
    );
  }
}
