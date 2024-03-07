import 'package:blablagithub/src/domain/app/repositories/app_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserCase {
  final AppRepository _appRepository;

  GetUserCase({
    required AppRepository appRepository,
  }) : _appRepository = appRepository;

  Future<User?> call() {
    return _appRepository.getUser();
  }
}
