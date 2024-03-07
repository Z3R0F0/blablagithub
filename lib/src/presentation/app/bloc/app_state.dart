part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class LoadingAppState extends AppState {}

class UnauthenticatedAppState extends AppState {}

class AuthenticatedAppState extends AppState {
  final User user;

  const AuthenticatedAppState({required this.user});
}
