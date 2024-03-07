import 'package:blablagithub/project_core/auth_client/auth_client.dart';
import 'package:blablagithub/project_core/utils/cool_methods.dart';

abstract class AuthRemoteDataSource {
  Future<bool> authGoogle();
  Future<bool> authApple();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthClient _authClient;

  AuthRemoteDataSourceImpl({
    required AuthClient authClient,
  }) : _authClient = authClient;

  @override
  Future<bool> authGoogle() async {
    return isNotNull(await _authClient.signInGoogle());
  }

  @override
  Future<bool> authApple() async {
    return isNotNull(await _authClient.signInWithApple());
  }
}
