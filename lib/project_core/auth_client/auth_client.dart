import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract class AuthClient {
  factory AuthClient(
      {required GoogleSignIn googleSignIn,
      required FirebaseApp fb,
      required FirebaseAuth fbAuth}) {
    return AuthClientImpl(googleSignIn: googleSignIn, fbAuth: fbAuth);
  }

  Future<User?> signInGoogle();

  Future<User?> signInWithApple();

  Future<User?> getLocalUser();

  Future<void> signOut();
}

class AuthClientImpl implements AuthClient {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _fbAuth;

  AuthClientImpl(
      {required GoogleSignIn googleSignIn, required FirebaseAuth fbAuth})
      : _googleSignIn = googleSignIn,
        _fbAuth = fbAuth;

  @override
  Future<User?> signInGoogle() async {
    User? user;

    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    if (account != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await account.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential =
            await _fbAuth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {}
      } catch (e) {
        print("Error: signInGoogle => $e");
      }
    }

    return user;
  }

  @override
  Future<User?> signInWithApple() async {
    User? user;

    try {
      final result = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: result.identityToken,
        accessToken: result.authorizationCode,
      );

      final UserCredential userCredential =
          await _fbAuth.signInWithCredential(oauthCredential);
      user = userCredential.user;
    } catch (e) {
      print("Error: signInWithApple => $e");
    }

    return user;
  }

  @override
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error: signOut => $e");
    }
  }

  @override
  Future<User?> getLocalUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }
}
