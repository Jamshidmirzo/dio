part of 'users_bloc.dart';

sealed class UsersState {}

final class InitialUsersState extends UsersState {}

final class LoadingUsersState extends UsersState {}

final class LoadedUsersState extends UsersState {
  final List<User> users;

  LoadedUsersState(this.users);
}

final class ErrorUsersState extends UsersState {
  final String message;

  ErrorUsersState(this.message);
}
