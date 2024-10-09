import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  // final AuthStorage authStorage;
  AuthenticationCubit() : super(const AuthenticationState.initial());
  Future<void> checkInitialStatus() async {
    emit(const Checking());
    // await _checkIsFirstTime();
    await Future.delayed(const Duration(seconds: 1));
    if (await _userExist()) {
      emit(const Authenticated());
    } else {
      emit(const UnAuthenticated());
    }
  }

  Future<bool> _userExist() async {
    final User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
