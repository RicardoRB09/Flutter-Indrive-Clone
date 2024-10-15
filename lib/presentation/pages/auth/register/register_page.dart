import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_clone/domain/utils/resource.dart';
import 'package:indriver_clone/presentation/pages/auth/register/bloc/register_bloc.dart';
import 'package:indriver_clone/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_clone/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indriver_clone/presentation/pages/auth/register/register_content.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            Fluttertoast.showToast(
                msg: response.message, timeInSecForIosWeb: 3);
          } else if (response is Success) {
            context.read<RegisterBloc>().add(FormReset());
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return RegisterContent(
              state: state,
            );
          },
        ),
      ),
    );
  }
}
