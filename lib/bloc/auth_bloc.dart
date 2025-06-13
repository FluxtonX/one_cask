import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      if (event.error != null) {
        emit(AuthFailure(event.error!));
        return;
      }
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(AuthFailure('Email and password cannot be empty'));
        return;
      }
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthSuccess(uid: '${event.email}-${event.password}'));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
