class GraphQLResponse {
  final Query query;

  GraphQLResponse({required this.query});

  factory GraphQLResponse.fromJson(Map<String, dynamic> json) {
    return GraphQLResponse(
      query: Query.fromJson(json['search']),
    );
  }
}

class Query {
  final SearchResultItemConnection search;

  Query({required this.search});

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(
      search: SearchResultItemConnection.fromJson(json),
    );
  }
}

class SearchResultItemConnection {
  final List<SearchResultItemEdge> edges;

  SearchResultItemConnection({required this.edges});

  factory SearchResultItemConnection.fromJson(Map<String, dynamic> json) {
    List<SearchResultItemEdge> edgesList = [];
    for (var edge in json['edges']) {
      edgesList.add(SearchResultItemEdge.fromJson(edge['node']));
    }
    return SearchResultItemConnection(edges: edgesList);
  }
}

class SearchResultItemEdge {
  final Repository node;

  SearchResultItemEdge({required this.node});

  factory SearchResultItemEdge.fromJson(Map<String, dynamic> json) {
    return SearchResultItemEdge(
      node: Repository.fromJson(json),
    );
  }
}

class Repository {
  final String typename;
  final String name;
  final Owner owner;
  final int stargazerCount;

  Repository({
    required this.typename,
    required this.name,
    required this.owner,
    required this.stargazerCount,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      typename: json['__typename'],
      name: json['name'],
      owner: Owner.fromJson(json['owner']),
      stargazerCount: json['stargazerCount'],
    );
  }
}

class Owner {
  final String typename;
  final String login;

  Owner({required this.typename, required this.login});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      typename: json['__typename'],
      login: json['login'],
    );
  }
}
