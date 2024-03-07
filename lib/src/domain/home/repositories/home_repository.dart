import 'package:blablagithub/src/domain/home/entities/search_options_entity.dart';
import 'package:blablagithub/src/domain/home/entities/search_result_entity.dart';

abstract class HomeRepository {
  Future<SearchResultEntity> search(
      {required SearchQueryEntity query, int? page});
}
