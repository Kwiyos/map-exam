import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:map_exam/login/login_screen.dart';

import '../login_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginInitial()) {
    on<onSignInPress>(_onSignInPress);
  }

  Future<FutureOr<void>> _onSignInPress(onSignInPress event, Emitter<LoginState> emit) async {
    final loginSuccess = await _loginRepository.loadLogin(event.email, event.password);
    if (loginSuccess) {
      emit(LoginSuccess());
    }
  }
}
