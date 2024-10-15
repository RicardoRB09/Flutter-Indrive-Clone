import 'package:indriver_clone/data/datasource/remote/services/auth_service.dart';
import 'package:indriver_clone/domain/models/auth_response.dart';
import 'package:indriver_clone/domain/models/user.dart';
import 'package:indriver_clone/domain/repository/auth_repository.dart';
import 'package:indriver_clone/domain/utils/resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }
}
