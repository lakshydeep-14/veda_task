part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = Initial;
  const factory AuthenticationState.checking() = Checking;
  const factory AuthenticationState.authenticated() = Authenticated;
  const factory AuthenticationState.unAuthenticated() = UnAuthenticated;
}
