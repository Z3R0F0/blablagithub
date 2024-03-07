import 'package:blablagithub/project_core/dependency_injection/bloc_injectoins.dart';
import 'package:blablagithub/project_core/dependency_injection/data_source_injections.dart';
import 'package:blablagithub/project_core/dependency_injection/dio_injections.dart';
import 'package:blablagithub/project_core/dependency_injection/graphql_injections.dart';
import 'package:blablagithub/project_core/dependency_injection/repository_injections.dart';
import 'package:blablagithub/project_core/dependency_injection/usecase_injections.dart';
import 'package:blablagithub/project_core/graphql_client/git_graphql.dart';
import 'package:blablagithub/project_core/graphql_client/git_graphql_client.dart';
import 'package:blablagithub/project_core/rest_client/git_rest_client.dart';
import 'package:blablagithub/project_core/rest_client/git_rest_dio.dart';
import 'package:blablagithub/src/data/app/datasources/app_local_datasource.dart';
import 'package:blablagithub/src/data/authentication/datasources/auth_remote_datasource.dart';
import 'package:blablagithub/src/data/home/datasources/search_remote_datasource.dart';
import 'package:blablagithub/src/domain/app/repositories/app_repository.dart';
import 'package:blablagithub/src/domain/app/usecases/get_user_case.dart';
import 'package:blablagithub/src/domain/app/usecases/logout_case.dart';
import 'package:blablagithub/src/domain/authentication/repositories/auth_repository.dart';
import 'package:blablagithub/src/domain/authentication/usecases/auth_apple_case.dart';
import 'package:blablagithub/src/domain/authentication/usecases/auth_google_case.dart';
import 'package:blablagithub/src/domain/home/repositories/home_repository.dart';
import 'package:blablagithub/src/domain/home/usecases/search_repos_case.dart';
import 'package:blablagithub/src/presentation/app/bloc/app_bloc.dart';
import 'package:blablagithub/src/presentation/authentication/bloc/auth_bloc.dart';
import 'package:blablagithub/src/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  group('Dependency Injection Tests', () {
    WidgetsFlutterBinding.ensureInitialized();
    GetIt locator = GetIt.instance;

    test('Dio Injections', () async {
      await initDioInjections();
      expect(locator.isRegistered<GitRestDio>(), true);
      expect(locator.isRegistered<GitRestClient>(), true);
    });

    test('GraphQL Injections', () async {
      await initGraphQLInjections();
      expect(locator.isRegistered<GitGraphQL>(), true);
      expect(locator.isRegistered<GitGraphQLClient>(), true);
    });

    test('Data Source Injections', () async {
      await initDataSourceInjections();
      expect(locator.isRegistered<AppLocalDataSource>(), true);
      expect(locator.isRegistered<AuthRemoteDataSource>(), true);
      expect(locator.isRegistered<SearchRemoteDataSource>(), true);
    });

    test('Repository Injections', () async {
      await initRepositoryInjections();
      expect(locator.isRegistered<AppRepository>(), true);
      expect(locator.isRegistered<AuthRepository>(), true);
      expect(locator.isRegistered<HomeRepository>(), true);
    });

    test('Usecase Injections', () async {
      await initUsecaseInjections();
      expect(locator.isRegistered<GetUserCase>(), true);
      expect(locator.isRegistered<LogoutCase>(), true);
      expect(locator.isRegistered<AuthGoogleCase>(), true);
      expect(locator.isRegistered<AuthAppleCase>(), true);
      expect(locator.isRegistered<SearchRepositoriesCase>(), true);
    });

    test('Bloc Injections', () async {
      await initBlocInjections();
      expect(locator.isRegistered<AppBloc>(), true);
      expect(locator.isRegistered<AuthBloc>(), true);
      expect(locator.isRegistered<HomeBloc>(), true);
    });
  });
}
