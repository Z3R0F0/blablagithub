import 'package:blablagithub/src/domain/authentication/usecases/auth_apple_case.dart';
import 'package:blablagithub/src/domain/authentication/usecases/auth_google_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthGoogleCase _authGoogleCase;
  final AuthAppleCase _authAppleCase;

  AuthBloc({
    required AuthGoogleCase authGoogleCase,
    required AuthAppleCase authAppleCase,
  })  : _authGoogleCase = authGoogleCase,
        _authAppleCase = authAppleCase,
        super(AuthInitial()) {
    on<AuthGoogleEvent>(_authGoogleEvent);
    on<AuthAppleEvent>(_authAppleEvent);
  }

  Future _authGoogleEvent(
      AuthGoogleEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      if (await _authGoogleCase.auth()) {
        emit(SuccessAuthState());
      } else {
        emit(FailureAuthState());
      }
    } catch (e) {
      emit(FailureAuthState());
    }
  }

  Future _authAppleEvent(AuthAppleEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());
      if (await _authAppleCase.auth()) {
        emit(SuccessAuthState());
      } else {
        emit(FailureAuthState());
      }
    } catch (e) {
      emit(FailureAuthState());
    }
  }
}
