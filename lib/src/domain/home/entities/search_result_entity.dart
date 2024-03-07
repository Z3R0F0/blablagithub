class SearchResultEntity {
  final int? totalCount;
  final List<SearchResultItem> items;

  SearchResultEntity({required this.totalCount, required this.items});
}

class SearchResultItem {
  final String name;
  final String? path;
  final String? sha;
  final String? url;
  final String? gitUrl;
  final String? htmlUrl;
  final RepositoryEntity repository;
  final double score;

  SearchResultItem({
    required this.name,
    this.path,
    this.sha,
    this.url,
    this.gitUrl,
    this.htmlUrl,
    required this.repository,
    required this.score,
  });
}

class RepositoryEntity {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool? private;
  final OwnerEntity owner;

  RepositoryEntity({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    required this.owner,
  });
}

class OwnerEntity {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? url;
  final String? owner;

  OwnerEntity({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.url,
    this.owner,
  });
}
