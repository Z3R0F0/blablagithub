import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/project_core/rest_client/git_rest_client.dart';
import 'package:blablagithub/project_core/rest_client/git_rest_dio.dart';

Future<void> initDioInjections() async {
  locator.registerLazySingleton(() => GitRestDio());
  locator.registerFactory(() => GitRestClient(
        locator<GitRestDio>().client,
      ));
}
