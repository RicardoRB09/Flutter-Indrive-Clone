import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone/domain/models/user.dart';
import 'package:indriver_clone/domain/utils/resource.dart';
import 'package:indriver_clone/presentation/utils/bloc_form_item.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const RegisterState({
    this.name = const BlocFormItem(error: 'Input a valid name'),
    this.lastName = const BlocFormItem(error: 'Input a valid lastname'),
    this.email = const BlocFormItem(error: 'Input a valid email'),
    this.phone = const BlocFormItem(error: 'Input a valid phone number'),
    this.password = const BlocFormItem(error: 'Input a valid password'),
    this.confirmPassword = const BlocFormItem(error: 'Confirm the password'),
    this.formKey,
    this.response,
  });

  toUser() => User(
      name: name.value,
      lastname: lastName.value,
      email: email.value,
      phone: phone.value,
      password: password.value);

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object> get props =>
      [name, lastName, email, phone, password, confirmPassword, response ?? {}];
}
