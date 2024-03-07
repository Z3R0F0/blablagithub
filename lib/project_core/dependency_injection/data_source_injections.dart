import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/src/data/app/datasources/app_local_datasource.dart';
import 'package:blablagithub/src/data/authentication/datasources/auth_remote_datasource.dart';
import 'package:blablagithub/src/data/home/datasources/search_remote_datasource.dart';

Future<void> initDataSourceInjections() async {
  locator.registerFactory<AppLocalDataSource>(() => AppLocalDataSourceImpl(
        authClient: locator(),
      ));
  locator.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        authClient: locator(),
      ));

  locator
      .registerFactory<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(
            restClient: locator(),
            graphQLClient: locator(),
          ));
}
