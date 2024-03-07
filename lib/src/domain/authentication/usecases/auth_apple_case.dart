import 'package:blablagithub/src/domain/authentication/repositories/auth_repository.dart';

class AuthAppleCase {
  final AuthRepository _authRepository;

  AuthAppleCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<bool> auth() {
    return _authRepository.authApple();
  }
}
