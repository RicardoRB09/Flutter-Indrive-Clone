import 'package:indriver_clone/domain/repository/auth_repository.dart';

import '../../models/user.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  run(User user) => authRepository.register(user);
}
