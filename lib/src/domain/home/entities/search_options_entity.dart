import 'package:blablagithub/enums/api_type.dart';

class SearchQueryEntity {
  final String query;
  final ApiType type;

  SearchQueryEntity({required this.query, required this.type});
}
