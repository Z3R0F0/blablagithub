import 'package:blablagithub/dependency_injection.dart';
import 'package:blablagithub/project_core/graphql_client/git_graphql.dart';
import 'package:blablagithub/project_core/graphql_client/git_graphql_client.dart';

Future<void> initGraphQLInjections() async {
  locator.registerLazySingleton(() => GitGraphQL.instance);
  locator.registerFactory(() => GitGraphQLClient(locator<GitGraphQL>().client));
}
