import 'package:blablagithub/models/git_graphql_response/git_graphql_response.dart';
import 'package:blablagithub/models/git_rest_response/git_rest_response.dart';
import 'package:blablagithub/src/domain/home/entities/search_result_entity.dart';

class GitResponseMapper {
  static SearchResultEntity mapToSearchResultEntity(GitResponse response) {
    return SearchResultEntity(
      totalCount: response.totalCount,
      items: response.items
          .map((item) => SearchResultItem(
                name: item.name,
                path: item.path,
                sha: item.sha,
                url: item.url,
                gitUrl: item.gitUrl,
                htmlUrl: item.htmlUrl,
                repository: RepositoryEntity(
                  id: item.repository.id,
                  nodeId: item.repository.nodeId,
                  name: item.repository.name,
                  fullName: item.repository.fullName,
                  private: item.repository.private,
                  owner: OwnerEntity(
                    login: item.repository.owner.login,
                    id: item.repository.owner.id,
                    nodeId: item.repository.owner.nodeId,
                    avatarUrl: item.repository.owner.avatarUrl,
                    url: item.repository.owner.url,
                    owner: item.repository.owner.owner,
                  ),
                ),
                score: item.score,
              ))
          .toList(),
    );
  }

  static SearchResultEntity mapToSearchResultEntityGraphQl(
      GraphQLResponse response) {
    return SearchResultEntity(
      totalCount: response.query.search.edges.length,
      items: response.query.search.edges
          .map((item) => SearchResultItem(
                name: item.node.name,
                repository: RepositoryEntity(
                  owner: OwnerEntity(
                    login: item.node.owner.login,
                  ),
                ),
                score: item.node.stargazerCount.toDouble(),
              ))
          .toList(),
    );
  }
}
