import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson81/data/models/user.dart';
import 'package:lesson81/data/repositories/users_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository _usersRepository;

  UsersBloc({required UsersRepository usersRepository})
      : _usersRepository = usersRepository,
        super(InitialUsersState()) {
    on<GetUsersEvent>(_getUsers);
  }

  void _getUsers(
    GetUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(LoadingUsersState());
    try {
      final response = await _usersRepository.getUsers();
      emit(LoadedUsersState(response));
    } catch (e) {
      emit(ErrorUsersState(e.toString()));
    }
  }
}
