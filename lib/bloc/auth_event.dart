part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  final String? error;

  AuthLoginRequested({
    required this.email,
    required this.password,
    this.error,
  });
}
