import 'package:bookia/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:bookia/features/auth/domain/repository/auth_repository.dart';
import 'package:bookia/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/register_use_case.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit({required this.registerUseCase, required this.loginUseCase})
    : super(AuthInitialState());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());
    try {
      final user = loginUseCase.execute(email: email, password: password);
      emit(AuthSuccessState(await user, "Welcome Back!"));
    } catch (e) {
      emit(AuthErrorState(e.toString().replaceAll("Exception", '')));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(AuthLoadingState());
    try {
      final user = registerUseCase.execute(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      emit(AuthSuccessState(await user, "Registration Successfully!"));
    } catch (e) {
      emit(AuthErrorState(e.toString().replaceAll("Exception", '')));
    }
  }
}
