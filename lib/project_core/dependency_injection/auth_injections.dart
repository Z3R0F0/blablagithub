import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/project_core/auth_client/auth_client.dart';
import 'package:blablagithub/project_core/auth_client/firebase_auth/firebase_auth_api.dart';
import 'package:blablagithub/project_core/auth_client/google_sign_in_api/google_sign_in_api.dart';

Future<void> initAuthInjections() async {
  locator.registerSingletonAsync<FirebaseAuthApi>(
      () async => await FirebaseAuthApi.getInstance());
  locator.registerSingletonAsync<GoogleSignInApi>(
      () async => await GoogleSignInApi.getInstance());

  locator.registerFactory<AuthClient>(() => AuthClientImpl(
        fbAuth: locator<FirebaseAuthApi>().fbAuth,
        googleSignIn: locator<GoogleSignInApi>().googleClient,
      ));
}
