import 'package:blablagithub/project_core/dependency_injection/auth_injections.dart';
import 'package:blablagithub/project_core/dependency_injection/bloc_injectoins.dart';
import 'package:blablagithub/project_core/dependency_injection/data_source_injections.dart';
import 'package:blablagithub/project_core/dependency_injection/dio_injections.dart';
import 'package:blablagithub/project_core/dependency_injection/graphql_injections.dart';
import 'package:blablagithub/project_core/dependency_injection/repository_injections.dart';
import 'package:blablagithub/project_core/dependency_injection/usecase_injections.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> initInjections() async {
  await initAuthInjections();
  await initDioInjections();
  await initGraphQLInjections();
  await initDataSourceInjections();
  await initRepositoryInjections();
  await initUsecaseInjections();
  await initBlocInjections();
}
