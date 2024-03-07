import 'package:blablagithub/enums/api_type.dart';
import 'package:blablagithub/models/git_graphql_response/git_graphql_response.dart';
import 'package:blablagithub/models/git_rest_response/git_rest_response.dart';
import 'package:blablagithub/project_core/graphql_client/git_graphql_client.dart';
import 'package:blablagithub/project_core/rest_client/git_rest_client.dart';
import 'package:blablagithub/src/data/home/mapper/git_response_entity_mapper.dart';
import 'package:blablagithub/src/domain/home/entities/search_options_entity.dart';
import 'package:blablagithub/src/domain/home/entities/search_result_entity.dart';

abstract class SearchRemoteDataSource {
  Future<SearchResultEntity> search(
      {required SearchQueryEntity query, int? page});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final GitRestClient _restClient;

  final GitGraphQLClient _graphQLClient;

  SearchRemoteDataSourceImpl({
    required GitRestClient restClient,
    required GitGraphQLClient graphQLClient,
  })  : _restClient = restClient,
        _graphQLClient = graphQLClient;

  @override
  Future<SearchResultEntity> search(
      {required SearchQueryEntity query, int? page}) async {
    if (query.type == ApiType.REST) {
      return GitResponseMapper.mapToSearchResultEntity(GitResponse.fromJson(
          await _restClient.search(query: query.query, page: page)));
    } else {
      var result = await _graphQLClient.search(query.query);

      result = GitResponseMapper.mapToSearchResultEntityGraphQl(
          GraphQLResponse.fromJson(result));
      return result;
    }
  }
}
