import 'package:indriver_clone/domain/use_cases/auth/login_use_case.dart';
import 'package:indriver_clone/domain/use_cases/auth/register_use_case.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;

  AuthUseCases({
    required this.login,
    required this.register,
  });
}
