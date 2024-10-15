import 'package:indriver_clone/domain/models/auth_response.dart';
import 'package:indriver_clone/domain/utils/resource.dart';

import '../models/user.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
}
