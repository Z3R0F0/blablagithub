abstract class AuthRepository {
  Future<bool> authGoogle();
  Future<bool> authApple();
}
