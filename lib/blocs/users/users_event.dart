part of 'users_bloc.dart';

sealed class UsersEvent {}

final class GetUsersEvent extends UsersEvent {}

final class AddUserEvent extends UsersEvent {}

final class EditUserEvent extends UsersEvent {}

final class DeleteUserEvent extends UsersEvent {}
