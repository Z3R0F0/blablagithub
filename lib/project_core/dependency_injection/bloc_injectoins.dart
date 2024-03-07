import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/src/presentation/app/bloc/app_bloc.dart';
import 'package:blablagithub/src/presentation/authentication/bloc/auth_bloc.dart';
import 'package:blablagithub/src/presentation/home/bloc/home_bloc.dart';

Future<void> initBlocInjections() async {
  locator.registerFactory(() => AppBloc(
        getUserCase: locator(),
        logoutCase: locator(),
      ));

  locator.registerFactory(() => AuthBloc(
        authGoogleCase: locator(),
        authAppleCase: locator(),
      ));

  locator.registerFactory(() => HomeBloc(
        searchRepositoriesCase: locator(),
      ));
}
