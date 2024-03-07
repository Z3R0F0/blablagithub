import 'package:blablagithub/src/domain/app/repositories/app_repository.dart';

class LogoutCase {
  final AppRepository _repository;

  LogoutCase({
    required AppRepository appRepository,
  }) : _repository = appRepository;

  Future<void> logout() {
    return _repository.logout();
  }
}
