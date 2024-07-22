part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class RegisterEvent extends AuthEvent {
  final String name;
  final String phone;
  final String password;

  RegisterEvent({
    required this.name,
    required this.phone,
    required this.password,
  });
}

final class LoginEvent extends AuthEvent {
  final String phone;
  final String password;

  LoginEvent({
    required this.phone,
    required this.password,
  });
}

final class VerifyOtpEvent extends AuthEvent {
  final String otpKey;
  final int otpCode;

  VerifyOtpEvent({
    required this.otpKey,
    required this.otpCode,
  });
}

final class LogoutEvent extends AuthEvent {}
