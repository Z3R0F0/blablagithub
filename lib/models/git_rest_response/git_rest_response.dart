import 'package:json_annotation/json_annotation.dart';

part 'git_rest_response.g.dart';

@JsonSerializable()
class GitResponse {
  final int? totalCount;
  final List<ObjectItem> items;

  GitResponse({required this.totalCount, required this.items});

  factory GitResponse.fromJson(Map<String, dynamic> json) =>
      _$GitResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GitResponseToJson(this);
}

@JsonSerializable()
class ObjectItem {
  final String name;
  final String? path;
  final String? sha;
  final String? url;
  final String? gitUrl;
  final String? htmlUrl;
  final RepositoryItem repository;
  final double score;

  ObjectItem(
      {required this.name,
      required this.path,
      required this.sha,
      required this.url,
      required this.gitUrl,
      required this.htmlUrl,
      required this.repository,
      required this.score});

  factory ObjectItem.fromJson(Map<String, dynamic> json) =>
      _$ObjectItemFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectItemToJson(this);
}

@JsonSerializable()
class RepositoryItem {
  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final bool? private;
  final RepoOwner owner;

  RepositoryItem(
      {required this.id,
      required this.nodeId,
      required this.name,
      required this.fullName,
      required this.private,
      required this.owner});

  factory RepositoryItem.fromJson(Map<String, dynamic> json) =>
      _$RepositoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoryItemToJson(this);
}

@JsonSerializable()
class RepoOwner {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? url;
  final String? owner;

  RepoOwner(
      {required this.login,
      required this.id,
      required this.nodeId,
      required this.avatarUrl,
      required this.url,
      required this.owner});

  factory RepoOwner.fromJson(Map<String, dynamic> json) =>
      _$RepoOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$RepoOwnerToJson(this);
}
