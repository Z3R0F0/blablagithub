part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchGitHubEvent extends HomeEvent {
  final SearchQueryEntity query;

  const SearchGitHubEvent({required this.query});
}

class SearchPaginationGitHubEvent extends HomeEvent {
  final SearchResultEntity items;
  final SearchQueryEntity query;
  final int? page;

  const SearchPaginationGitHubEvent(
      {required this.query, required this.items, this.page});
}
