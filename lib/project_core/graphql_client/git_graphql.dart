import 'package:blablagithub/constants/config.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GitGraphQL {
  static late GitGraphQL _instance;
  late GraphQLClient _client;

  static GitGraphQL get instance {
    _instance = GitGraphQL._internal();
    return _instance;
  }

  GitGraphQL._internal() {
    HttpLink httpLink = HttpLink(
      Config.GIT_GRAPHQL_BASE_URL,
    );

    AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer ${Config.GIT_TOKEN}',
    );

    Link link = authLink.concat(httpLink);

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );

    if (kDebugMode) {
      _client = _client.copyWith(
        link: link,
        cache: GraphQLCache(),
      );
    }
  }

  factory GitGraphQL() => GitGraphQL._internal();

  GraphQLClient get client => _client;
}
