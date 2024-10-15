import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indriver_clone/domain/utils/resource.dart';
import 'package:indriver_clone/presentation/pages/auth/register/bloc/register_event.dart';
import 'package:indriver_clone/presentation/pages/auth/register/bloc/register_state.dart';
import 'package:indriver_clone/presentation/utils/bloc_form_item.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  RegisterBloc(this.authUseCases) : super(const RegisterState()) {
    on<RegisterInitEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            formKey: formKey,
          ),
        );
      },
    );

    on<NameChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            name: BlocFormItem(
              value: event.name.value,
              error: event.name.value.isEmpty ? 'Input the name' : null,
            ),
            formKey: formKey,
          ),
        );
      },
    );

    on<LastNameChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            lastName: BlocFormItem(
              value: event.lastName.value,
              error: event.lastName.value.isEmpty ? 'Input the lastname' : null,
            ),
            formKey: formKey,
          ),
        );
      },
    );

    on<EmailChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            email: BlocFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Input a valid email' : null,
            ),
            formKey: formKey,
          ),
        );
      },
    );

    on<PhoneChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            phone: BlocFormItem(
              value: event.phone.value,
              error: event.phone.value.isEmpty
                  ? 'Input a valid phone number'
                  : null,
            ),
            formKey: formKey,
          ),
        );
      },
    );

    on<PasswordChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Input a password'
                  : event.password.value.length < 6
                      ? 'Must contains at least 6 characters'
                      : null,
            ),
            formKey: formKey,
          ),
        );
      },
    );

    on<ConfirmPasswordChanged>(
      (event, emit) {
        emit(
          state.copyWith(
            confirmPassword: BlocFormItem(
              value: event.confirmPassword.value,
              error: event.confirmPassword.value.isEmpty
                  ? 'Confirm the password'
                  : event.confirmPassword.value.length < 6
                      ? 'Must contains at least 6 characters'
                      : event.confirmPassword.value != state.password.value
                          ? 'Passwords do not match'
                          : null,
            ),
            formKey: formKey,
          ),
        );
      },
    );

    on<FormSubmit>((event, emit) async {
      print('Name: ${state.name.value}');
      print('Lastname: ${state.lastName.value}');
      print('Email: ${state.email.value}');
      print('Phone: ${state.phone.value}');
      print('Password: ${state.password.value}');
      print('Password Confirm: ${state.confirmPassword.value}');

      emit(
        state.copyWith(
          response: Loading(),
          formKey: formKey,
        ),
      );

      Resource response = await authUseCases.register.run(state.toUser());

      emit(
        state.copyWith(
          response: response,
          formKey: formKey,
        ),
      );
    });

    on<FormReset>(
      (event, emit) {
        state.formKey?.currentState?.reset();
      },
    );
  }
}
