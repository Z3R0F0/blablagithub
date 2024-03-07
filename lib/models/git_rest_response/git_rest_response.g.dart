// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_rest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitResponse _$GitResponseFromJson(Map<String, dynamic> json) => GitResponse(
      totalCount: json['totalCount'] as int?,
      items: (json['items'] as List<dynamic>)
          .map((e) => ObjectItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GitResponseToJson(GitResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'items': instance.items,
    };

ObjectItem _$ObjectItemFromJson(Map<String, dynamic> json) => ObjectItem(
      name: json['name'] as String,
      path: json['path'] as String?,
      sha: json['sha'] as String?,
      url: json['url'] as String?,
      gitUrl: json['gitUrl'] as String?,
      htmlUrl: json['htmlUrl'] as String?,
      repository:
          RepositoryItem.fromJson(json['repository'] as Map<String, dynamic>),
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$ObjectItemToJson(ObjectItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'sha': instance.sha,
      'url': instance.url,
      'gitUrl': instance.gitUrl,
      'htmlUrl': instance.htmlUrl,
      'repository': instance.repository,
      'score': instance.score,
    };

RepositoryItem _$RepositoryItemFromJson(Map<String, dynamic> json) =>
    RepositoryItem(
      id: json['id'] as int?,
      nodeId: json['nodeId'] as String?,
      name: json['name'] as String?,
      fullName: json['fullName'] as String?,
      private: json['private'] as bool?,
      owner: RepoOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepositoryItemToJson(RepositoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nodeId': instance.nodeId,
      'name': instance.name,
      'fullName': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
    };

RepoOwner _$RepoOwnerFromJson(Map<String, dynamic> json) => RepoOwner(
      login: json['login'] as String?,
      id: json['id'] as int?,
      nodeId: json['nodeId'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      url: json['url'] as String?,
      owner: json['owner'] as String?,
    );

Map<String, dynamic> _$RepoOwnerToJson(RepoOwner instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'nodeId': instance.nodeId,
      'avatarUrl': instance.avatarUrl,
      'url': instance.url,
      'owner': instance.owner,
    };
