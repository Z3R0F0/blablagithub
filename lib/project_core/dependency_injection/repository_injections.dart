import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/src/data/app/repositories/app_repository_impl.dart';
import 'package:blablagithub/src/data/authentication/repositories/auth_repository_impl.dart';
import 'package:blablagithub/src/data/home/repositories/home_repository_impl.dart';
import 'package:blablagithub/src/domain/app/repositories/app_repository.dart';
import 'package:blablagithub/src/domain/authentication/repositories/auth_repository.dart';
import 'package:blablagithub/src/domain/home/repositories/home_repository.dart';

Future<void> initRepositoryInjections() async {
  locator.registerFactory<AppRepository>(() => AppRepositoryImpl(
        localDataSource: locator(),
      ));
  locator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: locator(),
      ));
  locator.registerFactory<HomeRepository>(() => HomeRepositoryImpl(
        searchRemoteDataSource: locator(),
      ));
}
