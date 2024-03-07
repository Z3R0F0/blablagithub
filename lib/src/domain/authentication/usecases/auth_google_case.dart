import 'package:blablagithub/src/domain/authentication/repositories/auth_repository.dart';

class AuthGoogleCase {
  final AuthRepository _authRepository;

  AuthGoogleCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<bool> auth() {
    return _authRepository.authGoogle();
  }
}
