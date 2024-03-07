import 'package:blablagithub/src/domain/app/usecases/get_user_case.dart';
import 'package:blablagithub/src/domain/app/usecases/logout_case.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GetUserCase _getUser;
  final LogoutCase _logoutCase;

  AppBloc({
    required GetUserCase getUserCase,
    required LogoutCase logoutCase,
  })  : _getUser = getUserCase,
        _logoutCase = logoutCase,
        super(AppInitial()) {
    on<GetUserEvent>(_getUserEvent);
    on<LogoutAppEvent>(_logoutEvent);
  }

  Future<void> _getUserEvent(GetUserEvent event, Emitter<AppState> emit) async {
    try {
      emit(LoadingAppState());
      final user = await _getUser.call();
      if (user == null) {
        emit(UnauthenticatedAppState());
      } else {
        emit(AuthenticatedAppState(user: user));
      }
    } catch (_) {
      emit(UnauthenticatedAppState());
    }
  }

  Future<void> _logoutEvent(
      LogoutAppEvent event, Emitter<AppState> emit) async {
    await _logoutCase.logout();
    add(GetUserEvent());
  }
}
