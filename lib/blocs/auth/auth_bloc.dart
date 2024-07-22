import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:lesson81/data/repositories/auth_repository.dart';

import '../../data/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(InitialAuthState()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<LogoutEvent>(_onLogout);
  }

  void _onRegister(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingAuthState());
    try {
      final response = await _authRepository.register(
        name: event.name,
        phone: event.phone,
        password: event.password,
      );

      emit(OTPVerificationState(response.data['otp_key']));
    } on DioException catch (e) {
      // Dio paketini xatolini ko'rsatish
      emit(ErrorAuthState(e.response?.data));
    } catch (e) {
      // qolgan turdagi xatoliklarni ko'rsatish
      emit(
        ErrorAuthState(e.toString()),
      );
    }
  }

  void _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {}

  void _onVerifyOtp(
    VerifyOtpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingAuthState());

    try {
      final response = await _authRepository.verify(
        key: event.otpKey,
        code: event.otpCode,
      );

      if (response.data['detail'] == "Success") {
        emit(AuthenticatedAuthState());
      } else {
        emit(UnAuthenticatedAuthState());
      }
    } catch (e) {
      emit(ErrorAuthState(e.toString()));
    }
  }

  void _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {}
}
