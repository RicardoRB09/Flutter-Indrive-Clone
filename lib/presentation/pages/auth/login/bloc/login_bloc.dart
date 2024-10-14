import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indriver_clone/domain/utils/resource.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone/presentation/utils/bloc_form_item.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  LoginBloc(this.authUseCases) : super(const LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isEmpty ? 'Input a valid email' : null,
        ),
        formKey: formKey,
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isEmpty
              ? 'Input a valid password'
              : event.password.value.length < 6
                  ? 'Password must contains minimum 6 characters'
                  : null,
        ),
        formKey: formKey,
      ));
    });

    on<FormSubmit>((event, emit) async {
      print('Email : ${state.email.value}');
      print('Password : ${state.password.value}');
      emit(state.copyWith(
        response: Loading(),
        formKey: formKey,
      ));
      Resource response =
          await authUseCases.login.run(state.email.value, state.password.value);
      emit(state.copyWith(
        response: response,
        formKey: formKey,
      ));
    });
  }
}
