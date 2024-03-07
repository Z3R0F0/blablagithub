part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class LoadingHomeState extends HomeState {}

class FailureHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final SearchResultEntity items;

  const SuccessHomeState({required this.items});
}

class PaginationLoading extends HomeState {
  final SearchResultEntity items;

  const PaginationLoading({required this.items});
}
