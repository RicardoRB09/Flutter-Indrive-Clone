import 'package:indriver_clone/presentation/utils/bloc_form_item.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent {}

class NameChanged extends RegisterEvent {
  final BlocFormItem name;
  NameChanged({required this.name});
}

class LastNameChanged extends RegisterEvent {
  final BlocFormItem lastName;
  LastNameChanged({required this.lastName});
}

class EmailChanged extends RegisterEvent {
  final BlocFormItem email;
  EmailChanged({required this.email});
}

class PhoneChanged extends RegisterEvent {
  final BlocFormItem phone;
  PhoneChanged({required this.phone});
}

class PasswordChanged extends RegisterEvent {
  final BlocFormItem password;
  PasswordChanged({required this.password});
}

class ConfirmPasswordChanged extends RegisterEvent {
  final BlocFormItem confirmPassword;
  ConfirmPasswordChanged({required this.confirmPassword});
}

class FormSubmit extends RegisterEvent {}

class FormReset extends RegisterEvent {}
