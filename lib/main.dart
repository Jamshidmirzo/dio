import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson81/blocs/auth/auth_bloc.dart';
import 'package:lesson81/blocs/users/users_bloc.dart';
import 'package:lesson81/data/repositories/auth_repository.dart';
import 'package:lesson81/data/repositories/users_repository.dart';
import 'package:lesson81/data/services/dio_auth_service.dart';
import 'package:lesson81/data/services/dio_users_service.dart';

import 'app.dart';

void main() {
  final dioAuthService = DioAuthService();
  final dioUsersService = DioUsersService();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) {
          return AuthRepository(dioAuthService: dioAuthService);
        }),
        RepositoryProvider(create: (context) {
          return UsersRepository(dioUsersService: dioUsersService);
        }),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return AuthBloc(
                authRepository: context.read<AuthRepository>(),
              );
            },
          ),
          BlocProvider(
            create: (context) {
              return UsersBloc(
                usersRepository: context.read<UsersRepository>(),
              );
            },
          ),
        ],
        child: const MainApp(),
      ),
    ),
  );
}
