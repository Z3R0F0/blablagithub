import 'package:blablagithub/src/data/app/datasources/app_local_datasource.dart';
import 'package:blablagithub/src/domain/app/repositories/app_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppRepositoryImpl implements AppRepository {
  final AppLocalDataSource _localDataSource;

  AppRepositoryImpl({
    required AppLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<User?> getUser() async {
    return _localDataSource.user;
  }

  @override
  Future<void> logout() async {
    await _localDataSource.removeSession();
  }
}
