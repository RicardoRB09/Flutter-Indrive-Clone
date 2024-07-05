abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class EmailChanged extends LoginEvent {
  EmailChanged({required this.email});
  final String email;
}

class PasswordChanged extends LoginEvent {
  PasswordChanged({required this.password});
  final String password;
}

class FormSubmit extends LoginEvent {}
