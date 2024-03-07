import 'package:blablagithub/src/data/authentication/datasources/auth_remote_datasource.dart';
import 'package:blablagithub/src/domain/authentication/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<bool> authGoogle() async {
    return await _remoteDataSource.authGoogle();
  }

  @override
  Future<bool> authApple() async {
    return await _remoteDataSource.authApple();
  }
}
