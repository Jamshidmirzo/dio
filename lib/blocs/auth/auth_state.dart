part of 'auth_bloc.dart';

sealed class AuthState {}

final class InitialAuthState extends AuthState {}

final class LoadingAuthState extends AuthState {}

final class OTPVerificationState extends AuthState {
  final String optKey;

  OTPVerificationState(this.optKey);
}

final class AuthenticatedAuthState extends AuthState {}

final class UnAuthenticatedAuthState extends AuthState {}

final class ErrorAuthState extends AuthState {
  final String message;

  ErrorAuthState(this.message);
}
