import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:indriver_clone/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:indriver_clone/presentation/utils/bloc_form_item.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  LoginBloc() : super(const LoginState()) {
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

    on<FormSubmit>((event, emit) {
      log('Email : ${state.email.value}');
      log('Password : ${state.password.value}');
    });
  }
}
