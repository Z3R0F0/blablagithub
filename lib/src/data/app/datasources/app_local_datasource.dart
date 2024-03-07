import 'package:blablagithub/project_core/auth_client/auth_client.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AppLocalDataSource {
  Future<User?> get user;

  Future<void> removeSession();
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final AuthClient _authClient;

  AppLocalDataSourceImpl({
    required AuthClient authClient,
  }) : _authClient = authClient;

  @override
  Future<User?> get user async {
    return await _authClient.getLocalUser();
  }

  @override
  Future<void> removeSession() async {
    await _authClient.signOut();
  }
}
