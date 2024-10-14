import 'package:indriver_clone/data/datasource/remote/services/auth_service.dart';
import 'package:indriver_clone/data/repository/auth_repository_impl.dart';
import 'package:indriver_clone/domain/repository/auth_repository.dart';
import 'package:indriver_clone/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indriver_clone/domain/use_cases/auth/login_use_case.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService);

  @injectable
  AuthUseCases get authUseCases =>
      AuthUseCases(login: LoginUseCase(authRepository));
}
