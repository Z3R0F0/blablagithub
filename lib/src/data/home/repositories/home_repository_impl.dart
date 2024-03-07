import 'package:blablagithub/src/data/home/datasources/search_remote_datasource.dart';
import 'package:blablagithub/src/domain/home/entities/search_options_entity.dart';
import 'package:blablagithub/src/domain/home/entities/search_result_entity.dart';
import 'package:blablagithub/src/domain/home/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final SearchRemoteDataSource _searchRemoteDataSource;

  HomeRepositoryImpl({
    required SearchRemoteDataSource searchRemoteDataSource,
  }) : _searchRemoteDataSource = searchRemoteDataSource;

  @override
  Future<SearchResultEntity> search(
      {required SearchQueryEntity query, int? page}) async {
    return await _searchRemoteDataSource.search(query: query, page: page);
  }
}
