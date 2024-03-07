import 'package:blablagithub/src/domain/home/entities/search_options_entity.dart';
import 'package:blablagithub/src/domain/home/entities/search_result_entity.dart';
import 'package:blablagithub/src/domain/home/usecases/search_repos_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SearchRepositoriesCase _searchRepositoriesCase;

  HomeBloc({
    required SearchRepositoriesCase searchRepositoriesCase,
  })  : _searchRepositoriesCase = searchRepositoriesCase,
        super(HomeInitial()) {
    on<SearchGitHubEvent>(_searchEvent);
    on<SearchPaginationGitHubEvent>(_searchPaginationEvent);
  }

  Future<void> _searchEvent(
      SearchGitHubEvent event, Emitter<HomeState> emit) async {
    emit(LoadingHomeState());
    final repos = await _searchRepositoriesCase.search(query: event.query);
    emit(SuccessHomeState(items: repos));
  }

  Future<void> _searchPaginationEvent(
      SearchPaginationGitHubEvent event, Emitter<HomeState> emit) async {
    emit(PaginationLoading(items: event.items));
    final repos = await _searchRepositoriesCase.search(
        query: event.query, page: event.page);

    emit(SuccessHomeState(
        items: SearchResultEntity(
            totalCount: repos.totalCount,
            items: [...event.items.items, ...repos.items])));
  }
}
