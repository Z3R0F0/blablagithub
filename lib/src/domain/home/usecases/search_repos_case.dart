import 'package:blablagithub/src/domain/home/entities/search_options_entity.dart';
import 'package:blablagithub/src/domain/home/entities/search_result_entity.dart';
import 'package:blablagithub/src/domain/home/repositories/home_repository.dart';

class SearchRepositoriesCase {
  final HomeRepository _homeRepository;

  SearchRepositoriesCase({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  Future<SearchResultEntity> search(
      {required SearchQueryEntity query, int? page}) {
    return _homeRepository.search(query: query, page: page);
  }
}
