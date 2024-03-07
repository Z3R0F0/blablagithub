import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/src/domain/app/usecases/get_user_case.dart';
import 'package:blablagithub/src/domain/app/usecases/logout_case.dart';
import 'package:blablagithub/src/domain/authentication/usecases/auth_apple_case.dart';
import 'package:blablagithub/src/domain/authentication/usecases/auth_google_case.dart';
import 'package:blablagithub/src/domain/home/usecases/search_repos_case.dart';

Future<void> initUsecaseInjections() async {
  locator.registerFactory(() => GetUserCase(appRepository: locator()));
  locator.registerFactory(() => LogoutCase(appRepository: locator()));
  locator.registerFactory(() => AuthGoogleCase(authRepository: locator()));
  locator.registerFactory(() => AuthAppleCase(authRepository: locator()));

  locator
      .registerFactory(() => SearchRepositoriesCase(homeRepository: locator()));
}
