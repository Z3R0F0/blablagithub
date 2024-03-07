import 'package:graphql_flutter/graphql_flutter.dart';

class GitGraphQLClient {
  final GraphQLClient client;

  GitGraphQLClient(this.client);

  Future<dynamic> search(String query) async {
    const String gqlQuery = r'''
      query Search($queryString: String!) {
        search(query: $queryString, type: REPOSITORY, first: 10) {
          edges {
            node {
              ... on Repository {
                name
                owner {
                  login
                }
                stargazerCount
              }
            }
          }
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      document: gql(gqlQuery),
      variables: {'queryString': query},
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print('GraphQL Error: ${result.exception}');
    }

    return result.data;
  }
}
