import 'package:firebase_auth/firebase_auth.dart';

abstract class AppRepository {
  Future<User?> getUser();
  Future<void> logout();
}
